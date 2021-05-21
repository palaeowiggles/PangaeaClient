//
//  PangaeaDefaults.swift
//  PangaeaClient
//
//  Created by Heiko Pälike on 09/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

public struct PangaeaConfiguration {
  let metaBaseURL : URL
  let ddsBaseURL : URL
  let doiBase : String

}


let defaultMetaURLString = URL(string: "https://doi.pangaea.de/10.1594/")!
let defaultDataURLString = URL(string: "https://ws.pangaea.de/dds-fdp/rest/panquery?datasetDOI=")!
let defaultDOI = "doi.pangaea.de/10.1594/"
public let defaultConfiguration = PangaeaConfiguration(metaBaseURL: defaultMetaURLString, ddsBaseURL: defaultDataURLString, doiBase: defaultDOI)
