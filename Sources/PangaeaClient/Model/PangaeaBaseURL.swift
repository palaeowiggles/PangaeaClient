//
//  PangaeaBaseURL.swift
//  PangaeaXMLTest
//
//  Created by Heiko Pälike on 27/02/2019.
//  Copyright © 2021 Heiko Pälike. All rights reserved.
//

import Foundation

struct PangaeaBaseURLComponents {
	var metaBase = URL(string: "https://doi.pangaea.de/10.1594/")!
	var ddsBase = URL(string: "https://ws.pangaea.de/dds-fdp/rest/panquery?datasetDOI=")!
	var doiBase = "doi.pangaea.de/10.1594/"
	enum requestFormat : String {
		case Textfile = "?format=textfile"
		case Html = "?format=html"
		case MetainfoXML = "?format=metainfo_xml"
	}
}

extension PangaeaBaseURLComponents {
	func dataQueryURL(pangaeaID: String) -> URL {
		return URL(string: "\(ddsBase)\(doiBase)\(pangaeaID)")!
	}
	func metaQueryURL(pangaeaID: String) -> URL {
		return URL(string: "\(metaBase)\(pangaeaID)\(requestFormat.MetainfoXML.rawValue)")!
	}
}

protocol HasPangaeaBaseURLComponents {
	var pangaeaBaseURLComponents: PangaeaBaseURLComponents { get set }
}

protocol PangaeaBaseURLs: HasPangaeaBaseURLComponents { }

extension PangaeaBaseURLs {
	var metaBase: URL {
		get { return pangaeaBaseURLComponents.metaBase }
		set { pangaeaBaseURLComponents.metaBase = newValue }
	}
	var ddsBase: URL {
		get { return pangaeaBaseURLComponents.ddsBase }
		set { pangaeaBaseURLComponents.ddsBase = newValue }
	}
	var doiBase: String {
		get { return pangaeaBaseURLComponents.doiBase }
		set { pangaeaBaseURLComponents.doiBase = newValue }
	}
}

struct PangaeaBaseURL: PangaeaBaseURLs {
	var pangaeaBaseURLComponents = PangaeaBaseURLComponents()
}
