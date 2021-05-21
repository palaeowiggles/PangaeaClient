//
//  PangaeaData.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 27/02/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

public enum PMError: Error {
  case decoding(String)
}

public enum PangaeaMeta {
	case dataset(meta: PangaeaMetaBase, data: [PangaeaResultColumn], rowCount: Int)
  case dataParent(meta: PangaeaMetaBase, childrenURLs: [URL])
  case dataLink(meta: PangaeaMetaBase)
  case loginRequired(meta: PangaeaMetaBase)
	case error(pangaeaError: PangaeaError)
}

struct Dataset : Codable {
	
}
extension PangaeaMeta : Codable {
	enum CodingKeys: String, CodingKey {
		case dataset, dataParent, dataLink, loginRequired, error
	}
	enum CodingKeysDataset: String, CodingKey {
		case meta, data, rowCount
	}
	enum CodingKeysDataParent: String, CodingKey {
		case meta, childrenURLs
	}
	
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		if let dataSet = try container.decodeIfPresent(DataSet.self, forKey: .dataset) {
			self = .dataset(meta: dataSet.meta, data: dataSet.data, rowCount: dataSet.rowCount)
		} else if let dataParent = try container.decodeIfPresent(DataParent.self, forKey: .dataParent){
			self = .dataParent(meta: dataParent.meta, childrenURLs: dataParent.childrenURLs)
		} else if let meta = try container.decodeIfPresent(PangaeaMetaBase.self, forKey: .dataLink) {
			self = .dataLink(meta: meta)
		} else if let meta = try container.decodeIfPresent(PangaeaMetaBase.self, forKey: .loginRequired) {
			self = .loginRequired(meta: meta)
		} else {
			self = .error(pangaeaError: PangaeaError.decoding(message: "Could not decode PangaeaData entry"))
		}
	}
	
	private struct DataSet: Codable {
		let meta: PangaeaMetaBase
		let data: [PangaeaResultColumn]
		let rowCount: Int
	}
	
	private struct DataParent: Codable {
		let meta: PangaeaMetaBase
		let childrenURLs: [URL]
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
		case let .dataset(meta, data, rowCount):
			let dataSet = DataSet(meta: meta, data: data, rowCount: rowCount)
			try container.encode(dataSet, forKey: .dataset)
		case let .dataParent(meta, childrenURLs):
			let dataParent = DataParent(meta: meta, childrenURLs: childrenURLs)
			try container.encode(dataParent, forKey: .dataParent)
		case let .dataLink(meta):
			try container.encode(meta, forKey: .dataLink)
		case let .loginRequired(meta):
			try container.encode(meta, forKey: .loginRequired)
		case let .error(pangaeaError):
			try container.encode(pangaeaError, forKey: .error)
		}
	}
}

struct PMProjects: Codable {}
struct PMEvents: Codable {}

public struct PMSize {
  public var unit : String?
  public var value : Double
}
extension PMSize : Codable {
  enum CodingKeys: String, CodingKey {
      case unit
      case value = ""
  }
}

struct PMComment: Codable {}
struct PMAdditionalSearchableContent: Codable {}


let dateFormatterDefault : DateFormatter = {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-d'T'H:mm:ss"
  return dateFormatter
}()

let dateFormatterTechInfo : DateFormatter = {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy-MM-d'T'H:mm:ss'Z"
  return dateFormatter
}()

public typealias PMAbstract = String

public struct PangaeaMetaBase {
  public let citation : PMCitation?
  public let abstract : PMAbstract?
  public let references: [PMReference]
  public let technicalInfo : PMTechnicalInfo?
  public let extent: PMExtent?
  public let matrixColumns : [PMMatrixColumn]
  public let size : PMSize
  public let license: PMLicense?
  public let keywords: PMKeywords?
  public let version: String?
  public let event: [PMEvent]
  public let project: [PMProject]
	public let comment: String?
	private let _additionalSearchableContent: String?
	public var additionalSearchableContent : [String] {
		get {
			return self._additionalSearchableContent?
				.split(separator: "|")
				.compactMap{str in
				str.trimmingCharacters(in: .whitespacesAndNewlines)} ?? []
		}
	}
}

extension PangaeaMetaBase : Codable {
  enum CodingKeys: String, CodingKey {
      case citation = "md:citation"
      case abstract = "md:abstract"
      case references = "md:reference"
      case technicalInfo = "md:technicalInfo"
      case extent = "md:extent"
      case size = "md:size"
      case matrixColumns = "md:matrixColumn"
      case license = "md:license"
      case keywords = "md:keywords"
      case project = "md:project"
      case event = "md:event"
      case version = "version"
		case comment = "md:comment"
		case _additionalSearchableContent = "md:additionalSearchableContent"
  }
	

}

public enum DataColumn {
  case numeric([Double])
  case text([String])
  case geocode([Double])
  case datetime([Date?])
	case uri([URL])
	
	public var rowCount : Int {
		get {
			switch self {
			case let .numeric(rows):
				return rows.count
			case let .text(rows):
				return rows.count
			case let .geocode(rows):
				return rows.count
			case let .datetime(rows):
				return rows.count
			case let .uri(rows):
				return rows.count
			}
		}
	}

}

extension DataColumn: Codable {
  enum CodingKeys: String, CodingKey {
      case numeric, text, geocode, datetime, uri
  }
  
  public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      if let values = try container.decodeIfPresent([Double].self, forKey: .numeric) {
        self = .numeric(values)
      } else if let strings = try container.decodeIfPresent([String].self, forKey: .text) {
        self = .text(strings)
      } else if let values = try container.decodeIfPresent([Double].self, forKey: .geocode) {
        self = .geocode(values)
		} else if let values = try container.decodeIfPresent([URL].self, forKey: .uri) {
			self = .uri(values)
      } else {
        self = .datetime(try container.decode([Date?].self, forKey: .datetime))
      }
  }
  
  public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      switch self {
      case .numeric(let values):
        try container.encode(values, forKey: .numeric)
      case .text(let values):
        try container.encode(values, forKey: .text)
      case .geocode(let values):
        try container.encode(values, forKey: .geocode)
      case .datetime(let values):
        try container.encode(values, forKey: .datetime)
		case .uri(let values):
			try container.encode(values, forKey: .uri)
      }
  }
}

public struct PangaeaResultColumn : Codable {
  public let caption: String
  public let data: DataColumn
  public let dataMeta : PMMatrixColumn
}


