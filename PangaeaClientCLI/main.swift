//
//  main.swift
//  PangaeaClientCLI
//
//  Created by Heiko Pälike on 10/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
import PangaeaClient

var runRunLoop = true // necessary to keep runloop going
let runloop = RunLoop.current
let dateFormatter = ISO8601DateFormatter()

let client = PangaeaClient()
let id = "PANGAEA.547797" // Dataset
//let id = "PANGAEA.547942" // Parent
//let id = "PANGAEA.871273" // unpub Dataset Parent
//let id = "PANGAEA.871271"  // unpub Dataset
//let id = "PANGAEA.138777" // linked files
//let id = "PANGAEA.893044" //login required

client.fetch(pangaeaID: id, completionHandler: {result in
	switch result {
	case let .success(.dataset(meta: meta, data: data, rowCount: rowCount)):
		print("⇾ Results for id: \(id)")
		print("\n-⇾ META citation")
		if let citation = meta.citation {
			print("\(citation.author.compactMap({$0.authorDetails}).joined(separator: ", "))")
			print("\((citation.dateTime != nil) ? citation.dateTime!.description : "")")
			print("\(citation.title)")
			print(citation.parentURI ?? "")
			print(citation.sources.compactMap({$0.value}).joined(separator: ", "))
			print(citation.supplementTo ?? "")
		}
		
		print("\n-⇾ DATA column excerpt")
		
		print(data.map{$0.caption}.joined(separator: "\t"))
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
		let maxRows = min(rowCount, maxOutputLines)
		for i in 0..<maxRows {
			var line = [String]()
			for j in 0..<columnCount {
				line.append(result[j][i])
			}
			print(line.joined(separator: "\t"))
		}
		print("……………… \((result.first?.count ?? maxOutputLines)-maxOutputLines) more rows omitted")
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

