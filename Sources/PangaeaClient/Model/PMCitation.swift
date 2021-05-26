//
//  PMCitation.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 01/03/2019.
//  Copyright © 2021 Heiko Pälike. All rights reserved.
//

import Foundation
import XMLCoder

public struct PMCitation {
	public let title: String
	public let author: [PMAuthor]
	public let sources: [PMSource]
	public let volume: String?
	public let URI: String?
	public let parentURI: String?
	public let supplementTo: PMSupplement?
	public let dateTime: Date?
	public let year: String?
	public let prepubStatus: String?
	
}
extension PMCitation : Codable {
	enum CodingKeys : String, CodingKey {
		case title = "md:title"
		case author = "md:author"
		case sources = "md:source"
		case volume = "md:volume"
		case URI = "md:URI"
		case parentURI = "md:parentURI"
		case supplementTo = "md:supplementTo"
		case dateTime = "md:dateTime"
		case year = "md:year"
		case prepubStatus = "md:prepubStatus"
	}
}

public struct PMAuthor {
	public let lastName : String
	public let firstName: String?
	public let eMail: String?
	public let orcid: String?
	public let URI: String?
	
	public var authorDetails : String {
		get {
			var result = "\(lastName)"
			if let firstName = firstName {
				result.append(", \(firstName).")
			}
			return result
		}
	}
	
}
extension PMAuthor : Codable {
	enum CodingKeys : String, CodingKey {
		case lastName = "md:lastName"
		case firstName = "md:firstName"
		case eMail = "md:eMail"
		case orcid = "md:orcid"
		case URI = "md:URI"

	}
}


public struct PMSupplement {
	public let title : String
	public let author: [PMAuthor]
	public let sources: [PMSource]
	public let volume: String?
	public let URI: String?
	public let pages: String?
	public let year: String?
	public let prepubStatus: String?
	
}

extension PMSupplement : Codable {
	enum CodingKeys : String, CodingKey {
		case title = "md:title"
		case author = "md:author"
		case sources = "md:source"
		case volume = "md:volume"
		case URI = "md:URI"
		case pages = "md:pages"
		case year = "md:year"
		case prepubStatus = "md:prepubStatus"

	}
}

public struct PMSource {
	public let value : String
	public let id: String?
	public let relatedTermIds: String?
}

extension PMSource : Codable {
	enum CodingKeys : String, CodingKey {
		case value
		case id
		case relatedTermIds
	}
  //below is a hack because otherwise the decoding crunches when only string present, no id or other attribute like these two examples:
  //<md:source id="ref27368.journal14481" relatedTermIds="34013">Science</md:source>
  //<md:source>In: Wilson, PA; Lyle, M; Firth, JV (eds.), Proceedings of the Ocean Drilling Program, Scientific Results, College Station, TX (Ocean Drilling Program)</md:source>

	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		
		if let dict = try? container.decode([String:String].self),
			let val = dict[CodingKeys.value.stringValue] {
			self.value = val
			self.id = dict[CodingKeys.id.stringValue]
			self.relatedTermIds = dict[CodingKeys.relatedTermIds.stringValue]
		} else if let str = try? container.decode(String.self) {
			self.value = str
			self.id = nil
			self.relatedTermIds = nil
		} else {
			throw DecodingError.keyNotFound(CodingKeys.value, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "value not found"))
		}
		
	}
}


public struct PMReference {
	public let title : String
	public let author: [PMAuthor]
	public let sources: [PMSource]
	public let volume: String?
	public let URI: String?
	public let dateTime : Date?
	public let year: String?
	public let prepubStatus: String?
	
}
extension PMReference : Codable {
	enum CodingKeys : String, CodingKey {
		case title = "md:title"
		case author = "md:author"
		case sources = "md:source"
		case volume = "md:volume"
		case URI = "md:URI"
		case dateTime = "md:dateTime"
		case year = "md:year"
		case prepubStatus = "md:prepubStatus"
	}
}
