//
//  CommandLine.swift
//  PangaeaClientCLI
//
//  Created by Heiko Pälike on 21/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
import Rainbow
import PangaeaClientStatic

func processCommandLine() -> (pangaeaID: String, outputFilePath: String?, verbosity: Int, jsonOutput: Bool) {
	let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
	let version2 = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "unknown"
	
	// MARK: Command Line setup
	let cli = CommandLine()
	cli.formatOutput = { s, type in
		var str: String
		switch(type) {
			
		case .error:
			str = s.red.bold
		case .optionFlag:
			str = s.magenta.underline
		case .optionHelp:
			str = s.blue
		default:
			str = s
		}
		return cli.defaultFormat(s: str, type: type)
	}
	
	let help_option = BoolOption(shortFlag: "h", longFlag: "help", required: false, helpMessage: "Displays help message.")
	let outputFileOption = StringOption(shortFlag: "o", longFlag: "output", required: false, helpMessage: "Specify output file \\t. Default: stdout\\t")
	let verbosity = CounterOption(shortFlag: "v", longFlag: "verbose", required: false,
								  helpMessage: "Print verbose messages. Specify multiple times to increase verbosity.")
	let display_licenses = BoolOption(shortFlag: "l", longFlag: "licenses", required: false, helpMessage: "Shows licenses of code components used in this software.")
	
	let version_option = BoolOption(shortFlag: "V", longFlag: "version", required: false, helpMessage: "Shows current version and build of this software")
	let json_option = BoolOption(shortFlag: "j", longFlag: "jsonOutput", required: false, helpMessage: "Outputs all parsed Pangaea metadata and data as JSON")
	let clearCaches_option = BoolOption(shortFlag: "c", longFlag: "clearCaches", required: false, helpMessage: "Clears out all existing caches.")

	cli.addOptions(help_option, version_option, outputFileOption, json_option, clearCaches_option, verbosity, display_licenses)
	
	var pangaeaIDs = [String]()
	do {
		try cli.parse()
		pangaeaIDs = cli.unparsedArguments
	} catch {
		//cli.printUsage(error)
		cli.printCustomUsage("Usage: PangaeaClientCLI PANGAEA.ID [options] (for id: e.g. PANGAEA.547797).")
		exit(EX_USAGE)
	}
	
	let json = json_option.wasSet

	if clearCaches_option.wasSet {
		PangaeaClient().clearAllCaches()
		exit(0)
	}
	
	if help_option.wasSet {
		cli.printCustomUsage("Usage: PangaeaClientCLI PANGAEA.ID [options] (for id: e.g. PANGAEA.547797).")
		exit(0)
	}
	
	if version_option.wasSet {
		print("VERSION: PangaeaClientCLI (version \(version.red), build \(version2.red)) ©2019 Heiko Pälike.")
		exit(0)
	}
	
	if display_licenses.wasSet {
		print("PangaeaClientCLI Licenses:".bold)
		
		print(license.blue)
		print(vendorLicenses.blue)
		exit(0)
	}


	
	guard pangaeaIDs.count == 1,
		let pangaeaID = pangaeaIDs.first else {
			hpLog("Please provide exactly one PangaeaID (e.g. PANGAEA.547797)", messageKind: .error)
			cli.printCustomUsage("Usage: PangaeaClientCLI PANGAEA.ID [options] (for id: e.g. PANGAEA.547797).")
			exit(-1)
	}
	
	if let filePath = outputFileOption.value {
		hpLog( "Chosen output filepath: \(filePath)", messageKind: .info, verbosity: verbosity.value)

	}

	
	return (pangaeaID: pangaeaID, outputFilePath: outputFileOption.value, verbosity.value, jsonOutput: json)
	
}
