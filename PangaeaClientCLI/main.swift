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

let (id, outputFilePath, verbosity, jsonOutput) = processCommandLine()


let fileStream = FileHandlerOutputStream(outputFilePath)

var runRunLoop = true // necessary to keep runloop going
let runloop = RunLoop.current
let dateFormatter = ISO8601DateFormatter()
let jsonEncoder = JSONEncoder()
jsonEncoder.dateEncodingStrategy = .iso8601
jsonEncoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Inf", negativeInfinity: "-Inf", nan: "")

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
		hpLog( "⇾ Results for id: \(id)", messageKind: .info, verbosity: verbosity)


		if let citation = meta.citation {
			hpLog( "\n-⇾ META citation", messageKind: .info, verbosity: verbosity)

			var citationStrings = [String]()
			citationStrings.append("\(citation.author.compactMap({$0.authorDetails}).joined(separator: ", "))")
			citationStrings.append("\(citation.author.compactMap({$0.authorDetails}).joined(separator: ", "))")
			citationStrings.append("\((citation.dateTime != nil) ? citation.dateTime!.description : "")")
			citationStrings.append("\(citation.title)")
			citationStrings.append(citation.parentURI ?? "")
			citationStrings.append(citation.sources.compactMap({$0.value}).joined(separator: ", "))
			citationStrings.append("\(citation.supplementTo.debugDescription)")
			hpLog( "\(citationStrings.joined(separator: "\n"))", messageKind: .info, verbosity: verbosity)

		}
		hpLog("\n-⇾ DATA column excerpt", messageKind: .info, verbosity: verbosity)
//		print("\n-⇾ DATA column excerpt")
		
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
					if let date = date { return dateFormatter.string(from: date)} else { return ""}
				})
			case let .uri(urls):
				result.append(urls.map{$0.absoluteString})
			}
		}
		let maxOutputLines = 20
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
			if let jsonOut = try? jsonEncoder.encode(PangaeaMeta.dataset(meta: meta, data: data, rowCount: rowCount)),
			let outString = String(data: jsonOut, encoding: .utf8) {
				outputToStream(outString)
			}
		}

		//print("……………… \((result.first?.count ?? maxOutputLines)-maxOutputLines) more rows omitted")
	//print(result)
	case let .success(.dataParent(meta: meta, childrenURLs: childrenURLs)):
		print("This is a Parent record for multiple datasets with IDs: \(childrenURLs.map{$0.relativeString}). Please re-run query for cited dataset.")
	case let .success(.dataLink(meta: meta)):
		print("This Pangaea ID \(id) represents a link to binary data. Citation: \(String(describing: meta.citation)). Not implemented.")
	case let .success(.loginRequired(meta: meta)):
		print("Login is required for Pangaea ID \(id). Citation: \(String(describing: meta.citation?.title)). Not implemented.")
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

