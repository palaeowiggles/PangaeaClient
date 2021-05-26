//
//  CommandLine.swift
//  PangaeaClientCLI
//
//  Created by Heiko Pälike on 21/03/2019.
//  Copyright © 2021 Heiko Pälike. All rights reserved.
//

import Foundation
import Rainbow
import PangaeaClient
import ArgumentParser
import Logging

/*
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
	
}*/


struct PangaeaClientCLIParser: ParsableCommand {
    static let configuration =
      CommandConfiguration(
        commandName: "PangaeaClientCLI",
        abstract:
"""
A command-line tool to access remote datasets from the PANGAEA service.
""".bold,
        discussion:
"""
This tool downloads and parses structured data records from the PANGAEA
database service (https://pangaea.de). Currently only textual and numeric
datasets are supported. Output can be in ASCII table format, or JSON.


There are various options to:

""",
        version: "0.1.0",
        shouldDisplay: false,
        subcommands: [ParsableCommand.Type](),
        defaultSubcommand: nil,
        helpNames: nil)
  

  @Flag(name: [.customShort("j"), .long],
        help: "Outputs all parsed Pangaea metadata and data as JSON.")
  var json: Bool = false

  @Flag(name: [.customShort("c"), .long],
        help: "Clears out all existing caches.")
  var clearCaches: Bool = false

  @Flag(name: .long,
        help: "Show license for this project, and licenses of projects used.")
  var licenses: Bool = false
  
  @Flag(name: .long,
        help: "Show version for this tool.")
  var versions: Bool = false

  @Flag(name: .shortAndLong,
        help: "Verbose output. Multiple counts increase verbosity.")
  var verbosity: Int
  
  @Option(name: [.customShort("o"), .long],
          help: "Output filepath. (Default: stdout)")
  var outputFilePath: String?
  
  @Argument(help: "The PangaeaID to be retrieved (e.g. PANGAEA.547797)")
  var pangaeaID: String

  mutating func run() throws {
    logger.logLevel = Logger.Level(verbosity: verbosity, defaultLevel: defaultLogLevel)
    
    if licenses {
      print(PangaeaClient.license)
      print(PangaeaClient.vendorLicenses)

      PangaeaClientCLIParser.exit()
    }
    
    if versions {
      print("PangaeaClientCLI (version \(version.red), build \(version2.red)) ©2021 Heiko Pälike.")
      PangaeaClientCLIParser.exit()
    }
    logger.info("requested to load Pangaea dataset with ID: \(pangaeaID)")

  }
}

