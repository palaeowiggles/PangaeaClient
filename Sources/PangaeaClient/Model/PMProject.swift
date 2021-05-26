//
//  PMProject.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 02/03/2019.
//  Copyright © 2021 Heiko Pälike. All rights reserved.
//

import Foundation

public struct PMProject {
  public let label: String
  public let name: String?
  public let URI: String?
  public let award: PMAward?
}

extension PMProject: Codable {
  enum CodingKeys: String, CodingKey {
      case label = "md:label"
      case name = "md:name"
      case URI = "md:URI"
      case award = "md:award"
  }
}

public struct PMAward {
  public let number: String
  public let subtitle: String?
  public let URI: String?
  public let award: PMFunder?
}

extension PMAward: Codable {
  enum CodingKeys: String, CodingKey {
      case number = "md:number"
      case subtitle = "md:subtitle"
      case URI = "md:URI"
      case award = "md:award"
  }
}

public struct PMFunder {
  public let name: String
  public let optionalName: String?
  public let URI: String?
}

extension PMFunder: Codable {
  enum CodingKeys: String, CodingKey {
      case name = "md:name"
      case optionalName = "md:optionalName"
      case URI = "md:URI"
  }
}
