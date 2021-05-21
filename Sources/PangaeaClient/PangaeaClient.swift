//
//  PangaeaClient.swift
//  PangaeaClient
//
//  Created by Heiko Pälike on 09/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
import PromiseKit
import PMKFoundation
import Cache
import XMLCoder



public struct PangaeaClient {
  let dateFormatter : DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-d'T'H:mm:ss'Z"
      return dateFormatter
  }()
	
	static public let vendorLicenses = vendorlicenses
	static public let license = pangaeaClientLicense
	
  private let configuration: PangaeaConfiguration
  let decoder = XMLDecoder()
	
  var pangaeaMetaCacheController = PangaeaMetaCacheController.shared
  var pangaeaDataCacheController = PangaeaDataCacheController.shared

  
  public init(configuration: PangaeaConfiguration = defaultConfiguration){
      self.configuration = configuration
      decoder.dateDecodingStrategy = .formatted(dateFormatterDefault)
      decoder.shouldProcessNamespaces = false
      decoder.errorContextLength = 10
  }
	
	public func fetch(pangaeaID inputID: String, completionHandler: @escaping (Swift.Result<PangaeaMeta, Error>) -> Void) {
      let pangaeaID: String
      if let idInt = Int(inputID) {
        pangaeaID = "PANGAEA.\(idInt)"
      } else {
        pangaeaID = inputID
      }
      

		self.fetch(pangaeaID: pangaeaID)
			.done { result in
				switch result {
				case PangaeaMeta.dataset(meta: _, data: _, rowCount: _):
					//print(meta.citation)
					completionHandler(.success(result))
				case PangaeaMeta.dataParent(meta: _, childrenURLs: _):
					//print("This is a Parent record for multiple datasets with IDs: \(childrenURLs). Please re-run query for cited dataset.")
					completionHandler(.success(result))
				case PangaeaMeta.loginRequired(meta: _):
					//print("Login is required for Pangaea ID \(inputID). Not implemented.")
					completionHandler(.success(result))
				case PangaeaMeta.dataLink(meta: _):
					//print("This Pangaea ID \(inputID) represents a link to binary data. Not implemented.")
					completionHandler(.success(result))
				case let PangaeaMeta.error(pangaeaError: pangaeaError):
					completionHandler(.failure(pangaeaError))
				/*default:
					completionHandler(.success(result))*/
				}
			}
			.catch{ error in
				completionHandler(.failure(error))
		}
	}
  
  public func clearCaches(pangaeaID inputID: String) {
      let pangaeaID: String
      if let idInt = Int(inputID) {
        pangaeaID = "PANGAEA.\(idInt)"
      } else {
        pangaeaID = inputID
      }
      
      try? pangaeaMetaCacheController?.remove(id: pangaeaID)
      try? pangaeaDataCacheController?.remove(id: pangaeaID)
  }
  
  public func clearAllCaches() {
      try? pangaeaMetaCacheController?.removeAll()
      try? pangaeaDataCacheController?.removeAll()
  }
	
  private func fetch(pangaeaID inputID: String) -> Promise<PangaeaMeta> {
		
		return Promise { seal in
			let pangaeaID: String
			if let idInt = Int(inputID) {
				pangaeaID = "PANGAEA.\(idInt)"
			} else {
				pangaeaID = inputID
			}
			
			let metaURL = URL(string: pangaeaID+"?format=metainfo_xml",
                        relativeTo: configuration.metaBaseURL)!
			let dataURL = URL(
        string: "\(configuration.ddsBaseURL)\(configuration.doiBase)\(pangaeaID)")!

      let fetchMetaDataFunc = URLSession.shared
        .dataTask(.promise, with: metaURL).compactMap {
          String(data: $0.data, encoding: .utf8)
      }
        
      var fetchMetaData : Promise<String> {
          get {
            if let cachedPangaeaMeta = try? pangaeaMetaCacheController?
                .get(id: pangaeaID) {
                return Promise<String> {$0.fulfill(cachedPangaeaMeta) }
            } else {
                return fetchMetaDataFunc
            }
          }
      }
			
			let fetchDataFunc = URLSession.shared.dataTask(.promise, with: dataURL)
				.map{String(data: $0.data, encoding: .utf8) }
        
        var fetchData : Promise<String?> {
          get {
            if let cachedPangaeaData = try? pangaeaDataCacheController?.get(
                id: pangaeaID) {
              return Promise<String?> {$0.fulfill(cachedPangaeaData) }
            } else {
              return fetchDataFunc
            }
          }
        }
			
			let dateFormatterISO = ISO8601DateFormatter()
			
			fetchMetaData.done { metaDataStr in
            let _ = try? self.pangaeaMetaCacheController?.set(id: pangaeaID,
                                                              data: metaDataStr)
            
				if let metaData = metaDataStr.data(using: .utf8) {
					let meta = try self.decoder.decode(PangaeaMetaBase.self,
                                             from: metaData)
					
					guard //let hierarchyLevelStr = meta.technicalInfo?.entries[PMTechnicalInfo2.ValueCodingKeys.hierarchyLevel.rawValue],
						//let hierarchyLevel = PMTechnicalInfoHierarchyLevel(rawValue: hierarchyLevelStr),
						let mimeTypeStr = meta.technicalInfo?
              .entries[PMTechnicalInfo2.ValueCodingKeys.mimeType.rawValue],
						let mimeType = PMTechnicalInfoMimeType(rawValue: mimeTypeStr),
						let accessLevelStr = meta.technicalInfo?
              .entries[PMTechnicalInfo2.ValueCodingKeys.accessLevel.rawValue],
						let accessLevel = PMTechnicalInfoAccessLevel(
              rawValue: accessLevelStr)
						
						else {
							seal.reject(PangaeaError
                            .dataCorrupted(
                              message: "cannot determine hierarchyLevel, mimeType, accessLevel from metaInfo \(String(describing: meta.technicalInfo?.entries))"))
							return
							//print("cannot determine hierarchyLevel, mimeType, accessLevel from metaInfo \(String(describing: meta.technicalInfo?.entries))")
							//return
					}
					
					guard accessLevel == .unrestricted else {
						seal.fulfill(PangaeaMeta.loginRequired(meta: meta))
						return
					}
					
					guard meta.matrixColumns.count  > 0  else {
						let children = meta.technicalInfo?
							.entries["collectionChilds"]?
							.replacingOccurrences(of: "D", with: "PANGAEA.")
							.replacingOccurrences(of: "U", with: "PANGAEA.")
							.split(separator: ",")
							.compactMap({
                            URL(string: String($0),
                                relativeTo: self.configuration.metaBaseURL)
              })

						seal.fulfill(PangaeaMeta.dataParent(
                          meta: meta, childrenURLs: children ?? []))
						return
					}
					
					guard mimeType == .Tsv else {
						seal.fulfill(PangaeaMeta.dataLink(meta: meta))
						return
					}

					fetchData.done { dataStr in
                  if let dataStr = dataStr {
                    let _ = try? self.pangaeaDataCacheController?
                      .set(id: pangaeaID, data: dataStr)
                  }
						//print(dataStr)
						if let data = dataStr {
							let splitData = data.split(separator: "\n")
                .map({val in String(val).split(separator: "\t", maxSplits: 255, omittingEmptySubsequences: false)})
							var columns = [[String]]()
							guard meta.matrixColumns.count == splitData.first?.count else {
								seal.reject(
                  PangaeaError.dataCorrupted(
                    message: "meta column count different from first data row"))
								return
							}
							
							for col in 0..<meta.matrixColumns.count {
								var column = [String]()
								for row in 0..<splitData.count {
									column.append(String(splitData[row][col]))
								}
								columns.append(column)
							}
							
							var dataCols = [PangaeaResultColumn]()
							var rowCount = 0
							for colIndex in 0..<meta.matrixColumns.count {
								let col = meta.matrixColumns[colIndex]
								switch col.TypeType {
								case .numeric:
									let dataVal = columns[colIndex].map{Double($0) ?? Double.nan}
									let dataColStruct = PangaeaResultColumn(
                    caption: col.Caption, data: DataColumn.numeric(dataVal),
                    dataMeta: col)
									dataCols.append(dataColStruct)
								case .string:
									let dataVal = columns[colIndex]
									let dataColStruct = PangaeaResultColumn(
                    caption: col.Caption, data: DataColumn.text(dataVal),
                    dataMeta: col)
									dataCols.append(dataColStruct)
								case .geocode:
									let dataVal = columns[colIndex].map{Double($0) ?? Double.nan}
									let dataColStruct = PangaeaResultColumn(
                    caption: col.Caption, data: DataColumn.geocode(dataVal),
                    dataMeta: col)
									dataCols.append(dataColStruct)
								case .datetime:
									let dataVal = columns[colIndex]
                    .map{dateFormatterISO.date(from:$0)}
									let dataColStruct = PangaeaResultColumn(
                    caption: col.Caption, data: DataColumn.datetime(dataVal),
                    dataMeta: col)
									dataCols.append(dataColStruct)
								case .uri:
									let dataVal = columns[colIndex].compactMap{URL(string: $0)}
									let dataColStruct = PangaeaResultColumn(
                    caption: col.Caption, data: DataColumn.uri(dataVal),
                    dataMeta: col)
									dataCols.append(dataColStruct)
								}
								
								guard let tempRowCount = dataCols.first?.data.rowCount else {
									return
								}
								rowCount = tempRowCount

								
							}
							seal.fulfill(
                PangaeaMeta.dataset(
                  meta: meta, data: dataCols, rowCount: rowCount)
              )
						}
					}
						
					.catch({error in
						//print(error)
						seal.reject(error)
					})
				}
				
				
			}
			.catch { err in
				print(err)
				seal.reject(err)
			}
		}
  }
  
  
}


