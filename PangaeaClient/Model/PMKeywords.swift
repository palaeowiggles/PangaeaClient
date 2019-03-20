//
//  PMKeyword.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 02/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

public struct PMTechKeyword {
	public let unkeyedValue: String
	public let id: String?
	public let type: String?
}
extension PMTechKeyword: Codable {
	
	enum CodingKeys: String, CodingKey {
		case unkeyedValue = ""
		case id
		case type
	}
}
public typealias PMKeyword = PMTechKeyword

public enum PMKeywords {
	case keyword([PMKeyword])
	case techKeyword([PMTechKeyword])
}

extension PMKeywords: Codable {
    
    enum CodingKeys: String, CodingKey {
        case keyword = "md:keyword"
        case techKeyword = "md:techKeyword"
    }
	
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let kw = try container.decodeIfPresent([PMKeyword].self, forKey: .keyword) {
            self = .keyword(kw)
        } else if let kw = try container.decodeIfPresent([PMTechKeyword].self, forKey: .techKeyword) {
            self = .techKeyword(kw)
        } else {
            throw PMError.decoding("cannot decode Keyword from \(container.allKeys)")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .keyword(let kw):
            try container.encode(kw, forKey: .keyword)
        case .techKeyword(let kw):
            try container.encode(kw, forKey: .techKeyword)
        }
    }
}
