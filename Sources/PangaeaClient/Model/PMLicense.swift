//
//  PMLicense.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 02/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
public struct PMLicense {
  public let label: String
  public let name: String?
  public let URI: String?
}

extension PMLicense: Codable {
  enum CodingKeys: String, CodingKey {
      case label = "md:label"
      case name = "md:name"
      case URI = "md:URI"
  }
}
