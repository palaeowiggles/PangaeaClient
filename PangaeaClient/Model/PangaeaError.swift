//
//  PangaeaError.swift
//  PangaeaClient
//
//  Created by Heiko Pälike on 09/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
/// An error that occurs during execution.
public enum PangaeaError : Error {
	case dataCorrupted(message: String?)
	case decoding(message: String?)
}

extension PangaeaError : Codable {
	enum CodingKeys: String, CodingKey {
		case dataCorrupted, decoding
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if let message = try container.decodeIfPresent(String.self, forKey: .dataCorrupted) {
			self = .dataCorrupted(message: message)
		} else {
			self = .decoding(message: try container.decode(String.self, forKey: .decoding))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		switch self {
		case let .dataCorrupted(message):
			try container.encode(message, forKey: .dataCorrupted)
		case let .decoding(message):
			try container.encode(message, forKey: .decoding)
		}
	}
}

/*

/// The context in which the error occurred.
public struct Context {
/// A description of what went wrong, for debugging purposes.
public let debugDescription: String
/// The underlying error which caused this error, if any.
public let underlyingError: Error?
/// Creates a new context with a description of what went wrong.
///
/// - parameter debugDescription: A description of what went wrong, for
///   debugging purposes.
/// - parameter underlyingError: The underlying error which caused this
///   error, if any.
public init(debugDescription: String, underlyingError: Error? = nil){
self.debugDescription = debugDescription
self.underlyingError = underlyingError
}
}

/// An indication that a value of the given type could not be decoded because
/// it did not match the type of what was found in the encoded payload.
///
/// As associated values, this case contains the attempted type and context
/// for debugging.
case typeMismatch(Any.Type, PangaeaError.Context)

/// An indication that a non-optional value of the given type was expected,
/// but a null value was found.
///
/// As associated values, this case contains the attempted type and context
/// for debugging.
case valueNotFound(Any.Type, PangaeaError.Context)

///  An indication that a keyed decoding container was asked for an entry for
///  the given key, but did not contain one.
///
/// As associated values, this case contains the attempted key and context
/// for debugging.
case keyNotFound(CodingKey, PangaeaError.Context)

/// An indication that the data is corrupted or otherwise invalid.
///
/// As an associated value, this case contains the context for debugging.
*/
