//
//  Zstandard.h
//  Zstandard
//
//  Created by Heiko Pälike on 06/09/2016.
//  Copyright © 2016 Heiko Pälike. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for Zstandard.
FOUNDATION_EXPORT double ZstandardVersionNumber;

//! Project version string for Zstandard.
FOUNDATION_EXPORT const unsigned char ZstandardVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Zstandard/PublicHeader.h>

#define ZSTD_STATIC_LINKING_ONLY
#import <Zstandard/zstd.h>
//#import <Zstandard/zstd_static.h>
#import <Zstandard/zstd_errors.h>
//#import <Zstandard/zstd_legacy.h>

//#import <Zstandard/bitstream.h>
//#import <Zstandard/fse.h>
//#import <Zstandard/huf.h>
//#import <Zstandard/xxhash.h>
//#import <Zstandard/zbuff.h>
//#import <Zstandard/zstd_internal.h>



