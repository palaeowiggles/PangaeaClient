//
//  Utilities.swift
//  PangaeaClientCLI
//
//  Created by Heiko Pälike on 21/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation

public enum logMessageType {
	/** About text */
	case standard
	
	/** An error message */
	case error
	
	/** A warn message */
	case warn
	
	/** An info message */
	case info
}


public func hpLog(_ str: String, messageKind: logMessageType = .standard, verbosity: Int = 0 ) {
	switch messageKind {
	case .error:
		NSLog(str.red)
	case .info:
		if verbosity > 1 {
			NSLog(str.lightBlue)
		}
	case .warn:
		if verbosity > 0 {
			NSLog(str.lightRed)
		}
	default:
		NSLog(str.lightBlack)
	}
}

struct StderrStream: TextOutputStream {
	static let stream = StderrStream()
	func write(_ s: String) {
		fputs(s, stderr)
	}
}

struct StdoutStream: TextOutputStream {
	static var stream = StdoutStream()
	func write(_ s: String) {
		fputs(s, stdout)
	}
}

struct FileHandlerOutputStream: TextOutputStream {

	private let fileHandle: FileHandle
	let encoding: String.Encoding
	
	init?(_ filePath: String?, encoding: String.Encoding = .utf8) {
		guard let filePath = filePath,
			let fileHandle = FileHandle(forWritingAtPath: filePath) else {
			return nil
		}
		self.fileHandle = fileHandle
		self.encoding = encoding
	}
	
	init(_ fileHandle: FileHandle, encoding: String.Encoding = .utf8) {
		self.fileHandle = fileHandle
		self.encoding = encoding
	}
	
	mutating func write(_ string: String) {
		if let data = string.data(using: encoding) {
			fileHandle.write(data)
		}
	}
}

func outputToStream(_ string: String){
	if var fileStream = fileStream {
		print(string, to: &fileStream)
	} else {
		print(string, to: &StdoutStream.stream)
	}
}
