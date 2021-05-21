//
//  PMEvent.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 02/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
import XMLCoder

public typealias PMBasis = PMLocation
public typealias PMDevice = PMLocation

public struct PMEvent {
  public let label: String
  public let optionalLabel: String?
  public let URI: String?
  public let latitude: Double?
  public let longitude: Double?
  public let elevation: Double?
  public let dateTime: Date?
  public let latitude2: Double?
  public let longitude2: Double?
  public let elevation2: Double?
  public let dateTime2: Date?
  public let attributes: [PMAttribute]?
  public let location: PMLocation?
  public let campaign: PMCampaign?
  public let basis: PMBasis?
  public let device: PMDevice?
  public let comment: String?
}

extension PMEvent: Codable {
  enum CodingKeys: String, CodingKey {
      case label = "md:label"
      case optionalLabel = "md:name"
      case URI = "md:URI"
      case latitude  = "md:latitude"
      case longitude = "md:longitude"
      case elevation = "md:elevation"
      case dateTime  = "md:dateTime"
      case latitude2 = "md:latitude2"
      case longitude2 = "md:longitude2"
      case elevation2 = "md:elevation2"
      case dateTime2 = "md:dateTime2"
      case attributes = "md:attribute"
      case location = "md:location"
      case campaign = "md:campaign"
      case basis = "md:basis"
      case device = "md:device"
      case comment = "md:comment"
  }
 /*  init(from decoder: Decoder) throws {
      //decoder2.listDecodingStrategy = .collapseListUsingItemTag("md:event")
      var altContainer = try decoder.singleValueContainer()
	let test = altContainer.
	unkeyedContainer()
      print(altContainer)
      let label = try altContainer.decode(String.self)
//	decode(String.self, forKey: .label)
      self = PMEvent(label: label, optionalLabel: nil, URI: nil, latitude: nil, longitude: nil, elevation: nil, dateTime: nil, latitude2: nil, longitude2: nil, elevation2: nil, dateTime2: nil, attributes: nil, location: nil, campaign: nil, basis: nil, device: nil, comment: nil)
  }*/
}

public struct PMCampaign {
  public let name: String
  public let optionalName : String?
  public let URI: String?
  public let attributes: [PMAttribute]? //[PMAttribute:String]?
}

extension PMCampaign: Codable {
  enum CodingKeys: String, CodingKey {
      case name = "md:name"
      case optionalName = "md:optionalName"
      case URI = "md:URI"
      case attributes = "md:attribute"

      
  }
}

/*struct PMAttributeList: Codable, Equatable {
	let items: [PMAttribute]
	
	enum CodingKeys: String, CodingKey {
		case items = "md:attribute"
	}
}*/


public struct PMAttribute: Codable, DynamicNodeEncoding {
	let name: String
	let unkeyedValue: String
	
	enum CodingKeys: String, CodingKey {
		case name
		case unkeyedValue = ""
	}
	
	public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
		switch key {
		case CodingKeys.name:
			return .attribute
		default:
			return .element
		}
	}
}

