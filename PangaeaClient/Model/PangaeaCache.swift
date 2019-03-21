//
//  PangaeaCache.swift
//  PangaeaClient
//
//  Created by Heiko Pälike on 17/03/2019.
//  Copyright © 2019 Heiko Pälike. All rights reserved.
//

import Foundation
import Cache
import PromiseKit
//import PMKFoundation

public enum CacheKey : String {
    case metaCacheKey
    case dataCacheKey
}

public struct PangaeaMetaCache : Codable {
    let eTag: String //UTF8 encoded eTag
    let metaData: String //PangaeaMetaBase
}

public struct PangaeaDataCache : Codable {
    let eTag: String //UTF8 encoded eTag
    let data: String //[PangaeaResultColumn]
}

struct PangaeaMetaCacheController {
    public static let shared = PangaeaMetaCacheController()
    let diskConfig = DiskConfig(name: "org.palaeowiggles.PangaeaMetaCache")
    let cacheKey = CacheKey.metaCacheKey.rawValue
    let memoryConfig = MemoryConfig()
    var storage : Storage!

    init?(){
        if let storage = try? Storage(diskConfig: diskConfig, memoryConfig: memoryConfig){
            self.storage = storage
        }
        else {
            return nil
        }
    }
    
    func get(id: String) throws -> String {
		let compressedData = try storage.entry(ofType: Data.self, forKey: id).object
		let uncompressedString = try decompress(compressedData: compressedData)

		guard let result = String(data: uncompressedString, encoding: .utf8) else {
			throw PangaeaError.decoding(message: "error in ZSTD decompression of cache for \(id)")
		}
		return result
    }
    
    func set(id: String, data: String) throws {
		if let stringData = data.data(using: .utf8) {
			let compressed = try compress(data: stringData, compressionLevel: 17)
			return try storage.setObject(compressed, forKey: id)
		} else {
            return try storage.setObject(data, forKey: id)
        }
    }
    
    func remove(id: String) throws {
        return try storage.removeObject(forKey: id)
    }
    func removeAll() throws {
        return try storage.removeAll()
    }
}

struct PangaeaDataCacheController {
    public static let shared = PangaeaDataCacheController()
    let diskConfig = DiskConfig(name: "org.palaeowiggles.PangaeaDataCache")
    let cacheKey = CacheKey.dataCacheKey.rawValue
    let memoryConfig = MemoryConfig()
    var storage : Storage!

    init?(){
        if let storage = try? Storage(diskConfig: diskConfig, memoryConfig: memoryConfig){
            self.storage = storage
        }
        else {
            return nil
        }
    }
    
	func get(id: String) throws -> String {
		let compressedData = try storage.entry(ofType: Data.self, forKey: id).object
		let uncompressedString = try decompress(compressedData: compressedData)
		guard let result = String(data: uncompressedString, encoding: .utf8) else {
			throw PangaeaError.decoding(message: "error in ZSTD decompression of cache for \(id)")
		}
		return result
	}
    
	func set(id: String, data: String) throws {
		if let stringData = data.data(using: .utf8) {
			let compressed = try compress(data: stringData, compressionLevel: 17)
			//let compressed =  try processor.compressBuffer(stringData, compressionLevel: 17)
			return try storage.setObject(compressed, forKey: id)
		} else {
			return try storage.setObject(data, forKey: id)
		}
	}
    
    func remove(id: String) throws {
        return try storage.removeObject(forKey: id)
    }
    func removeAll() throws {
        return try storage.removeAll()
    }
}
