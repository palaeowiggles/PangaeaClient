//
//  PMMatrixColumn.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 01/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

public struct PMParameter {
    public let name: String
    public let shortName : String
    public let unit: String?
    public let group: String?
    public let URI: String?
    public let id: String?
    public let relatedTermIds: String?
}

extension PMParameter : Codable {
    enum CodingKeys: String, CodingKey {
        case name = "md:name"
        case shortName = "md:shortName"
        case unit = "md:unit"
        case group = "md:group"
        case URI = "md:URI"
        case id = "id"
        case relatedTermIds = "relatedTermIds"
    }
}

public struct PMMethod {
    public let name: String
    public let optionalName : String?
    public let URI: String?
    public let id: String?
}

extension PMMethod : Codable {
    enum CodingKeys: String, CodingKey {
        case name = "md:name"
        case optionalName = "md:optionalName"
        case URI = "md:URI"
        case id = "id"
    }
}

public enum PMColumnType : String {
    case numeric
    case string
    case geocode
    case datetime
	case uri
}

extension PMColumnType : Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(Swift.String.self)
        if let type = PMColumnType(rawValue: string) {
            self = type
        } else {
            throw PMError.decoding("error decoding \(string) as PMColumnType")
        }
    }
}

public struct PMPI {
    public let lastName: String
    public let firstName : String?
    public let eMail: String?
    public let URI: String?
    public let orcid: String?
}

extension PMPI : Codable {
    enum CodingKeys: String, CodingKey {
        case lastName = "md:lastName"
        case firstName = "md:optionalName"
        case eMail = "md:eMail"
        case URI = "md:URI"
        case orcid = "md:orcid"
    }
}

public struct PMMatrixColumn {
    public let Caption: String
    public let Parameter: PMParameter
    public let Method: PMMethod?
    public let PI: PMPI?
    public let Behaviour: String?
    public let Column: Int
    public let Format: String?
    public let Label: String
    public let Source: String?
    public let TypeType: PMColumnType
    public let Comment: String?
    public let id: String?
}

extension PMMatrixColumn : Codable {
    
    enum CodingKeys: String, CodingKey {
        case Caption = "md:caption"
        case Parameter = "md:parameter"
        case Method = "md:method"
        case PI = "md:PI"
        case Behaviour = "behaviour"
        case Column = "col"
        case Format = "format"
        case Label = "label"
        case Source = "source"
        case TypeType = "type"
        case Comment = "md:comment"
        case id = "id"
    }
}



