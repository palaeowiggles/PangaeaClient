//
//  main.swift
//  PangaeaClientCLI
//
//  Created by Heiko Pälike on 10/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
import PangaeaClient
import Rainbow
import ArgumentParser
import Logging

//MARK: Version Info (not yet cross-platform)
let bundle = Bundle.init(identifier: "PangaeaClient") ?? Bundle.main
let version = bundle.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
let version2 = bundle.infoDictionary?["CFBundleVersion"] as? String ?? "unknown"

//MARK: Logging setup
let defaultLogLevel: Logger.Level = .info
LoggingSystem.bootstrap(StreamLogHandler.standardError)

var logger = Logger(label: "org.palaeowiggles.PangaeaClient")
logger.logLevel = defaultLogLevel
logger.info(.init(stringLiteral:
      "PangaeaClientCLI".green.bold +
      "(version \(version.red), build \(version2.red)).".blue.bold +
      " ©2021 Heiko Pälike"
))


var parser = PangaeaClientCLIParser.parseOrExit()

logger.logLevel = Logger.Level(verbosity: parser.verbosity,
                               defaultLevel: defaultLogLevel)


let id = parser.pangaeaID
let outputFilePath = parser.outputFilePath
let verbosity = parser.verbosity
let jsonOutput = parser.json

let fileStream = FileHandlerOutputStream(outputFilePath, encoding: .utf8)

var runRunLoop = true // necessary to keep runloop going
let runloop = RunLoop.current
let dateFormatter = ISO8601DateFormatter()
let jsonEncoder = JSONEncoder()
jsonEncoder.dateEncodingStrategy = .iso8601
jsonEncoder.nonConformingFloatEncodingStrategy =
  .convertToString(positiveInfinity: "Inf", negativeInfinity: "-Inf", nan: "")

let client = PangaeaClient()
//let id = "PANGAEA.547797" // Dataset
//let id = "PANGAEA.547942" // Parent
//let id = "PANGAEA.871273" // unpub Dataset Parent
//let id = "PANGAEA.871271"  // unpub Dataset
//let id = "PANGAEA.138777" // linked files
//let id = "PANGAEA.893044" //login required

client.fetch(pangaeaID: id, completionHandler: {result in
	switch result {
	case let .success(.dataset(meta: meta, data: data, rowCount: rowCount)):
    logger.info("⇾ Results for id: \(id)")

		if let citation = meta.citation {
      logger.info( "\n-⇾ META citation")

			var citationStrings = [String]()
			citationStrings.append("\(citation.author.compactMap({$0.authorDetails}).joined(separator: ", "))")
			citationStrings.append("\(citation.author.compactMap({$0.authorDetails}).joined(separator: ", "))")
			citationStrings.append("\((citation.dateTime != nil) ? citation.dateTime!.description : "")")
			citationStrings.append("\(citation.title)")
			citationStrings.append(citation.parentURI ?? "")
			citationStrings.append(citation.sources.compactMap({$0.value}).joined(separator: ", "))
			citationStrings.append("\(citation.supplementTo.debugDescription)")
      logger.info( "\(citationStrings.joined(separator: "\n"))")

		}
    logger.info( "\n-⇾ DATA column excerpt")
		
		var output = ""

		print(data.map{$0.caption}.joined(separator: "\t").bold, to: &output)
		var result = [[String]]()
		let columnCount = data.count
		for i in 0..<columnCount {
			let col = data[i]
			let data = col.data
			switch data {
			case let .numeric(numbers):
				result.append(numbers.map{"\($0)"})
			case let .text(text):
				result.append(text)
			case let .geocode(numbers):
				result.append(numbers.map{"\($0)"})
			case let .datetime(dates):
				result.append(dates.map{ date in
					if let date = date { return dateFormatter.string(from: date)}
          else { return ""}
				})
			case let .uri(urls):
				result.append(urls.map{$0.absoluteString})
			}
		}
		//let maxOutputLines = 20
		//let maxRows = min(rowCount, maxOutputLines)
		let maxRows = rowCount
		for i in 0..<maxRows {
			var line = [String]()
			for j in 0..<columnCount {
				line.append(result[j][i])
			}
			print(line.joined(separator: "\t"), to: &output)
		}
		
		switch jsonOutput {
		case false:
			outputToStream(output)
		case true:
			if let jsonOut = try? jsonEncoder.encode(
          PangaeaMeta.dataset(meta: meta, data: data, rowCount: rowCount)
      ),
			let outString = String(data: jsonOut, encoding: .utf8) {
				outputToStream(outString)
			}
		}

	  case let .success(.dataParent(meta: meta, childrenURLs: childrenURLs)):
      print("This is a Parent record for multiple datasets with IDs: \(childrenURLs.map{$0.relativeString}). Please re-run query for cited dataset.")
        switch jsonOutput {
        case false:
          break
        case true:
          if let jsonOut = try? jsonEncoder.encode(meta),
              let outString = String(data: jsonOut, encoding: .utf8) {
              outputToStream(outString)
          }
        }
	  case let .success(.dataLink(meta: meta)):
      print("This Pangaea ID \(id) represents a link to binary data. Citation: \(String(describing: meta.citation)). Not implemented.")
        switch jsonOutput {
        case false:
          break
        case true:
          if let jsonOut = try? jsonEncoder.encode(meta),
              let outString = String(data: jsonOut, encoding: .utf8) {
              outputToStream(outString)
          }
        }
	  case let .success(.loginRequired(meta: meta)):
      print("Login is required for Pangaea ID \(id). Citation: \(String(describing: meta.citation?.title)). Not implemented.")
        switch jsonOutput {
        case false:
          break
        case true:
          if let jsonOut = try? jsonEncoder.encode(meta),
              let outString = String(data: jsonOut, encoding: .utf8) {
              outputToStream(outString)
          }
        }
	  case let .success(.error(pangaeaError: pangaeaError)):
		  print("could not receive Pangaea ID \(id), error: \(pangaeaError)")
    case let .failure(error: error):
		  print("could not receive Pangaea ID \(id), error: \(error)")
	}
	runRunLoop = false
	exit(0)
})

dispatchMain() // necessary to keep runloop going

/*while(runRunLoop == true && runloop.run(mode: .default, before: Date.distantFuture)){}*/

