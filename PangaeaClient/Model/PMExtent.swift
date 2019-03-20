//
//  PMExtent.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 01/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

public struct PMExtent {
	public let geographic: PMGeographic?
	public let temporal: [PMTemporal?]
	public let elevation: PMElevation?
	public let topoType: PMTopoType?
}

extension PMExtent: Codable {
	enum CodingKeys: String, CodingKey {
		case geographic = "md:geographic"
		case temporal = "md:temporal"
		case elevation = "md:elevation"
		case topoType = "md:topoType"
	}
}

public struct PMTopoType {
	public let id : String?
	public let unkeyedValue : String?
}
extension PMTopoType: Codable {
	enum CodingKeys: String, CodingKey {
		case id
		case unkeyedValue = ""
	}
}

public struct PMGeographic {
	public let westBoundLon: Double
	public let eastBoundLon: Double
	public let southBoundLat: Double
	public let northBoundLat: Double
	public let meanLon: Double
	public let meanLat: Double
	public let location : PMLocation?
}

extension PMGeographic: Codable {
	enum CodingKeys: String, CodingKey {
		case westBoundLon = "md:westBoundLongitude"
		case eastBoundLon = "md:eastBoundLongitude"
		case southBoundLat = "md:southBoundLatitude"
		case northBoundLat = "md:northBoundLatitude"
		case meanLon = "md:meanLongitude"
		case meanLat = "md:meanLatitude"
		case location = "md:location"
	}
}

public struct PMLocation {
	public let name: String
	public let optionalName : String?
	public let URI: String?
}

extension PMLocation: Codable {
	enum CodingKeys: String, CodingKey {
		case name = "md:name"
		case optionalName = "md:optionalName"
		case URI = "md:URI"

	}
}

public struct PMTemporal {
	public let minDateTime: Date
	public let maxDateTime : Date
}

extension PMTemporal: Codable {
	enum CodingKeys: String, CodingKey {
		case minDateTime = "md:minDateTime"
		case maxDateTime = "md:maxDateTime"
	}
}

public struct PMElevation {
	public let min: Double
	public let max : Double
}

extension PMElevation: Codable {
	enum CodingKeys: String, CodingKey {
		case min = "md:min"
		case max = "md:max"
	}
}
