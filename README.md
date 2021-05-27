#  PangaeaClient

Heiko Pälike (c) 2021

[![DOI](https://zenodo.org/badge/176691169.svg)](https://zenodo.org/badge/latestdoi/176691169)

This code library allows retrieval of data from https://www.pangaea.de, a repository for
scientific data. The full set of meta-data is parsed from the Pangaea xml representation.
It currently retrieves data only for child records. Parent records retrieve the dois of the children.

It is written in the Swift language, and uses a number of third-party libraries 
(see VendorLicenses.swift)

A Playground is provided to show parts of the capabilities. Data retrievals are cached
for faster subsequent access.

The code and libraries is written in pure swift, and should thus be useable on all platforms
supporting Swift (macOS, Linux, Windows). Swift package manager installation is now implemented.

Playground Example: 

```swift
/*:
# PangaeaClient
**PangaeaClient Playground**

Please first build the PangaeaClient framework.
This playground obtains data from https://www.pangaea.de and displays
the first 20 lines.
*/



import Foundation
import PlaygroundSupport
import PangaeaClient

PlaygroundPage.current.needsIndefiniteExecution

let client = PangaeaClient()
let id = "PANGAEA.547797" // Dataset
//let id = "PANGAEA.547942" // Parent
//let id = "PANGAEA.871273" // unpub Dataset Parent
//let id = "PANGAEA.871271"  // large Dataset
//let id = "PANGAEA.896621" //unpublished
//let id = "PANGAEA.138777" // linked files (not implemented)
//let id = "PANGAEA.893044" //login required (not implemented)

let dateFormatter = ISO8601DateFormatter()
//client.clearAllCaches() // to clear PangaeaClient caches for meta and data
//client.clearCaches(pangaeaID: id)
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
  PlaygroundPage.current.finishExecution()
})
```

Output:
```
⇾ Results for id: PANGAEA.547797

-⇾ META citation
Pälike, Heiko., Norris, Richard D., Herrle, Jens O., Wilson, Paul A., Coxall, Helen., Lear, Caroline H., Shackleton, Nicholas J., Tripati, Aradhna K., Wade, Bridget S.
2006-11-03 09:41:05 +0000
Age model based on benthic foraminiferal stable isotopes of sediment core ODP Site 199-1218, equatorial Pacific
https://doi.org/10.1594/PANGAEA.547942



-⇾ DATA column excerpt
Depth [m]  Depth comp [mcd]  Depth cr [rmcd]  Sample label  Age model [ka] (consistent with Cande and Ken...)  Age model [ka] (calibrated manually to astron...)  Age model [ka] (calibrated automatically to a...)  Cibicidoides spp.δ13C [‰ PDB]  Cibicidoides spp.δ18O [‰ PDB]  C. grimsdaleiδ13C [‰ PDB]  C. grimsdaleiδ18O [‰ PDB]  C. havanensisδ13C [‰ PDB]  C. havanensisδ18O [‰ PDB]  Comment  Reference
54.6  61.89  61.89  199-1218B-7H-3,25-27  19369.0  18952.0  18953.0  1.1  1.78  nan  nan  nan  nan  Lear et al., 2004
55.6  62.89  62.89  199-1218B-7H-3,125-127  19523.0  19085.0  19085.0  0.99  1.92  nan  nan  nan  nan  Lear et al., 2004
56.1  63.39  63.39  199-1218B-7H-4,25-27  19600.0  19151.0  19152.0  1.14  1.54  nan  nan  nan  nan  Lear et al., 2004
56.6  63.89  63.89  199-1218B-7H-4,75-77  19677.0  19217.0  19218.0  1.1  1.67  nan  nan  nan  nan  Lear et al., 2004
56.95  65.01  64.97  199-1218A-7H-1,125-127  19844.0  19361.0  19285.0  1.12  1.86  nan  nan  nan  nan  Lear et al., 2004
57.1  64.39  64.39  199-1218B-7H-4,125-127  19755.0  19284.0  19351.0  1.03  1.58  nan  nan  nan  nan  Lear et al., 2004
57.45  65.51  65.51  199-1218A-7H-2,25-27  19927.0  19433.0  19362.0  nan  1.6  nan  nan  nan  nan  Lear et al., 2004
57.6  64.89  64.89  199-1218B-7H-5,25-27  19832.0  19350.0  19424.0  0.92  1.5  nan  nan  nan  nan  Lear et al., 2004
57.95  66.01  66.01  199-1218A-7H-2,75-77  20004.0  19499.0  19434.0  1.0  nan  nan  nan  nan  nan  Lear et al., 2004
58.1  65.39  65.44  199-1218B-7H-5,75-77  19916.0  19423.0  19487.0  0.93  1.74  nan  nan  nan  nan  Lear et al., 2004
58.45  66.51  66.51  199-1218A-7H-2,125-127  20082.0  19566.0  19500.0  1.1  2.01  nan  nan  nan  nan  Lear et al., 2004
58.45  66.51  66.51  199-1218A-7H-2,125-127  20082.0  19566.0  19567.0  0.82  1.77  nan  nan  nan  nan  Lear et al., 2004
58.6  65.89  65.91  199-1218B-7H-5,125-127  19989.0  19486.0  19567.0  1.09  1.78  nan  nan  nan  nan  Lear et al., 2004
58.95  67.01  67.01  199-1218A-7H-3,25-27  20159.0  19616.0  19617.0  0.75  1.77  nan  nan  nan  nan  Lear et al., 2004
59.45  67.51  67.51  199-1218A-7H-3,75-77  20237.0  19651.0  19652.0  0.81  1.73  nan  nan  nan  nan  Lear et al., 2004
59.95  68.01  68.01  199-1218A-7H-3,125-127  20314.0  19716.0  19717.0  0.66  1.99  nan  nan  nan  nan  Lear et al., 2004
60.45  68.51  68.51  199-1218A-7H-4,25-27  20392.0  19802.0  19803.0  nan  1.62  nan  nan  nan  nan  Lear et al., 2004
61.95  70.01  70.01  199-1218A-7H-5,25-27  20658.0  20175.0  20176.0  0.82  1.99  nan  nan  nan  nan  Lear et al., 2004
62.45  70.51  70.51  199-1218A-7H-5,75-77  20772.0  20273.0  20274.0  0.81  1.45  nan  nan  nan  nan  Lear et al., 2004
62.65  71.04  71.04  199-1218B-8H-2,25-27  20917.0  20362.0  20358.0  nan  1.62  nan  nan  nan  nan  Lear et al., 2004
……………… 3433 more rows omitted
```
