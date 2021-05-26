//
//  PMTechnicalInfo.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 01/03/2019.
//  Copyright © 2021 Heiko Pälike. All rights reserved.
//
import Foundation

protocol PMTechnicalInfoValue : Codable {}

typealias PMTechnicalInfoFileName = String
typealias PMTechnicalInfoLastModified = Date
extension PMTechnicalInfoFileName : PMTechnicalInfoValue {}
extension PMTechnicalInfoLastModified : PMTechnicalInfoValue {}

public enum PMDOIRegistryStatus: String {
  case Registered = "registered"
  case RegisteredInLeadTime = "registration is in the lead time"
}

extension PMDOIRegistryStatus : PMTechnicalInfoValue {
  enum CodingKeys: String, CodingKey {
      case Registered = "registered"
      case RegisteredInLeadTime = "registration is in the lead time"
  }
}

public enum PMTechnicalInfoMimeType : String {
	case Zip = "application/zip"
	case Tsv = "text/tab-separated-values"
}


extension PMTechnicalInfoMimeType : PMTechnicalInfoValue {
	enum CodingKeys: String, CodingKey {
		case Zip = "application/zip"
		case Tsv = "text/tab-separated-values"
	}
	public init(from decoder: Decoder) throws {
		let string = try decoder.singleValueContainer().decode(String.self)
		if let type = CodingKeys(rawValue: string) {
			switch type {
			case .Tsv: self = .Tsv
			case .Zip: self = .Zip
			}
		} else {
			throw PMTechnicalInfo2.TechnicalInfo.PMTechnicalInfoError.decoding("error decoding \(string) as PMTechnicalInfoMimeType")
		}
	}
}

public enum PMTechnicalInfoStatus : String {
	case Validated = "validated"
  case Published = "published"
}

extension PMTechnicalInfoStatus : PMTechnicalInfoValue {
	enum CodingKeys: String, CodingKey {
		case Validated = "validated"
		case Published = "published"
	}
	public init(from decoder: Decoder) throws {
		let string = try decoder.singleValueContainer().decode(String.self)
		if let type = CodingKeys(rawValue: string) {
			switch type {
			case .Validated: self = .Validated
			case .Published: self = .Published
			}
		} else {
			throw PMTechnicalInfo2.TechnicalInfo.PMTechnicalInfoError.decoding("error decoding \(string) as PMTechnicalInfoStatus")
		}
	}
}

public enum PMTechnicalInfoHierarchyLevel : String, Codable {
	case Parent = "parent"
  case Child = "child"
}

extension PMTechnicalInfoHierarchyLevel : PMTechnicalInfoValue {
	enum CodingKeys: String, CodingKey {
		case Parent = "parent"
		case Child = "child"
	}
	public init(from decoder: Decoder) throws {
		let string = try decoder.singleValueContainer().decode(String.self)
		if let type = CodingKeys(rawValue: string) {
			switch type {
			case .Parent: self = .Parent
			case .Child: self = .Child
			}
		} else {
			throw PMTechnicalInfo2.TechnicalInfo.PMTechnicalInfoError.decoding("error decoding \(string) as PMTechnicalInfoHierarchyLevel")
		}
	}
}

public enum PMTechnicalInfoAccessLevel : String, Codable {
	case registered = "registered"
  case unrestricted = "unrestricted"
	case loginRequired = "access rights needed"
}

extension PMTechnicalInfoAccessLevel : PMTechnicalInfoValue {
	enum CodingKeys: String, CodingKey {
		case registered = "registered"
		case unrestricted = "unrestricted"
		case loginRequired = "access rights needed"
	}
	public init(from decoder: Decoder) throws {
		let string = try decoder.singleValueContainer().decode(String.self)
		if let type = CodingKeys(rawValue: string) {
			switch type {
			case .registered: self = .registered
			case .unrestricted: self = .unrestricted
			case .loginRequired: self = .loginRequired

			}
		} else {
			throw PMTechnicalInfo2.TechnicalInfo.PMTechnicalInfoError.decoding("error decoding \(string) as PMTechnicalInfoAccessLevel")
		}
	}
}

public struct PMTechnicalInfo {
  var entries : [String:String]
}

typealias ContainerAlias = Array<[String:String]>


extension PMTechnicalInfo: Codable {
  
  enum CodingKeys: String, CodingKey {
      case entries = "md:entry"
  }
  enum MapCodingKeys: String, CodingKey { case key, value }
  
  public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      

      let dict = try container.decode([[String:String]].self, forKey: .entries)
      let result = dict.reduce(into: [String:String]()) { (result, dict) in
        if let key = dict[MapCodingKeys.key.stringValue],
        let value = dict[MapCodingKeys.value.stringValue] {
            result[key] = value
        }
        
      }
      entries = result
  }
	
	public func encode(to encoder: Encoder) throws {
		//container(keyedBy: CodingKeys.self)
      //var container = encoder.container(keyedBy: CodingKeys.self)
      var container = encoder.container(keyedBy: CodingKeys.self)

      
      var result = [[String:String]]()
		for (key, value) in entries {
        let entry = ["key": key, "value": value]
        result.append(entry)
         // encode(entry, forKey: .entries)
		}
      try container.encode(result, forKey: .entries)

		//try container.encode(result, forKey: .entries)
	}
		
}
  
public struct PMTechnicalInfo2 {
	var properties : [TechnicalInfo]
	
	
	//var lastModified : PMTechnicalInfoLastModified
	//var fileName : PMTechnicalInfoFileName
	//var mimeType : PMTechnicalInfoMimeType
	//var status : PMTechnicalInfoStatus
	//var hierarchyLevel : PMTechnicalInfoHierarchyLevel
	//var accessLevel : PMTechnicalInfoAccessLevel


	var lastModified : PMTechnicalInfoLastModified? {
		get {
			if let item = properties.lazy.first(where: {if case .lastModified(_) = $0 {return true} else {return false}}),
			case let .lastModified(value) = item {return value} else {return nil}
		}
	}
	
	var fileName : PMTechnicalInfoFileName? {
		get {
			if let item = properties.lazy.first(where: {if case .fileName(_) = $0 {return true} else {return false}}),
				case let .fileName(value) = item {return value} else {return nil}
		}
	}
	
	var mimeType : PMTechnicalInfoMimeType? {
		get {
			if let item = properties.lazy.first(where: {if case .mimeType(_) = $0 {return true} else {return false}}),
				case let .mimeType(value) = item {return value} else {return nil}
		}
	}
	
	var status : PMTechnicalInfoStatus? {
		get {
			if let item = properties.lazy.first(where: {if case .status(_) = $0 {return true} else {return false}}),
				case let .status(value) = item {return value} else {return nil}
		}
	}
	
	var hierarchyLevel : PMTechnicalInfoHierarchyLevel? {
		get {
			if let item = properties.lazy.first(where: {if case .hierarchyLevel(_) = $0 {return true} else {return false}}),
				case let .hierarchyLevel(value) = item {return value} else {return nil}
		}
	}
	
	var accessLevel : PMTechnicalInfoAccessLevel? {
		get {
			if let item = properties.lazy.first(where: {if case .accessLevel(_) = $0 {return true} else {return false}}),
				case let .accessLevel(value) = item {return value} else {return nil}
		}
	}
	
	var unknownEntries : [TechnicalInfo] {
		get {
			return properties.filter({if case .unknownEntry = $0 {return true} else {return false}})
		}
	}
}

extension PMTechnicalInfo2: Codable {
	
	enum ContainerCodingKeys: String, CodingKey {
		case entries = "md:entry"
	}
	
	enum ValueCodingKeys: String, CodingKey, CaseIterable {
		case lastModified = "xmlLastModified"
		case fileName = "filename"
		case mimeType = "mimeType"
		case status = "status"
		case hierarchyLevel = "hierarchyLevel"
		case accessLevel = "loginOption"
		
	}
	
	enum MapCodingKeys: String, CodingKey { case key, value }
	
	enum TechnicalInfo: Codable {
		case lastModified(PMTechnicalInfoLastModified)
		case fileName(PMTechnicalInfoFileName)
		case mimeType(PMTechnicalInfoMimeType)
		case status(PMTechnicalInfoStatus)
		case hierarchyLevel(PMTechnicalInfoHierarchyLevel)
		case accessLevel(PMTechnicalInfoAccessLevel)
		case unknownEntry([String:String])
		
		public enum PMTechnicalInfoError: Error {
			case decoding(String)
		}
		
		init(from decoder: Decoder) throws {
			
			let container = try decoder.container(keyedBy: MapCodingKeys.self)
			let type = try container.decode(String.self, forKey: .key)
			
			if let enumType = ValueCodingKeys(rawValue: type) {
				switch enumType {
				case .fileName:
					let fileName = try container.decode(String.self.self, forKey: .value)
					self = .fileName(fileName)
				case .lastModified:
					let dateStr = try container.decode(String.self, forKey: .value)
					if let date = dateFormatterTechInfo.date(from: dateStr) {
						self = .lastModified(date)
					} else {
						throw PMTechnicalInfoError.decoding("Cannot parse Date from \(dump(dateStr))")
					}
				case .mimeType:
					let mimeType = try container.decode(PMTechnicalInfoMimeType.self, forKey: .value)
					self = .mimeType(mimeType)
				case .accessLevel:
					let accessLevel = try container.decode(PMTechnicalInfoAccessLevel.self, forKey: .value)
					self = .accessLevel(accessLevel)
				case .hierarchyLevel:
					let hierarchyLevel = try container.decode(PMTechnicalInfoHierarchyLevel.self, forKey: .value)
					self = .hierarchyLevel(hierarchyLevel)
				case .status:
					let status = try container.decode(PMTechnicalInfoStatus.self, forKey: .value)
					self = .status(status)
				default:
					let value = try container.decode([String:String].self, forKey: .value)
					self = .unknownEntry(value)
					throw TechnicalInfo.PMTechnicalInfoError.decoding("Error decoding \(dump(type))")
				}
			} else {
				let value = try container.decode(String.self, forKey: .value)
				self = .unknownEntry([type:value])
			}
			
		}
		
		func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: ValueCodingKeys.self)
			switch self {
			case .fileName(let fileName):
				try container.encode(fileName, forKey: .fileName)
			case .lastModified(let date):
				let str = dateFormatterTechInfo.string(from: date)
				try container.encode(str, forKey: .lastModified)
			case .mimeType(let mimeType):
				try container.encode(mimeType, forKey: .mimeType)
			case .hierarchyLevel(let hierarchyLevel):
				try container.encode(hierarchyLevel, forKey: .hierarchyLevel)
			case .accessLevel(let accessLevel):
				try container.encode(accessLevel, forKey: .accessLevel)
			case .status(let status):
				try container.encode(status, forKey: .status)
			case .unknownEntry(let dict):
				if let first = dict.first {
					try container.encode([first.key:first.value], forKey: .unknown)
				}
			}
		}
		
		enum ValueCodingKeys: String, CodingKey, CaseIterable {
			case lastModified = "xmlLastModified"
			case fileName = "filename"
			case mimeType = "mimeType"
			case status = "status"
			case hierarchyLevel = "hierarchyLevel"
			case accessLevel = "loginOption"
			case key
			case value
			case unknown
		}
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: ContainerCodingKeys.self)
		self.properties = try container.decode([TechnicalInfo].self, forKey: .entries)
	}
}
