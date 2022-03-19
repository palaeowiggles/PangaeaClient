// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PangaeaClient",
  
  platforms: [
  .macOS("10.12"),
  ],
  
  products: [
  .library(
    name: "PangaeaClient",
    targets: ["PangaeaClient"]),
  .executable(
    name: "PangaeaClientCLI",
    targets: ["PangaeaClientCLI"]),
  ],

  
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
    .package(url: "https://github.com/apple/swift-log", .upToNextMajor(from: "1.4.0")),
    .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "4.0.0")),
    .package(url: "https://github.com/MaxDesiatov/XMLCoder", from: "0.12.0"),
    .package(url: "https://github.com/mxcl/PromiseKit", .exactItem("7.0.0-rc2")),
    .package(name: "PMKFoundation", url: "https://github.com/astrotuna201/Foundation", from: "3.3.8"),
    .package(url: "https://github.com/L1MeN9Yu/Elva", from: "1.5.2"),
    .package(url: "https://github.com/hyperoslo/Cache", from: "6.0.0"),
  ],
  targets: [
    .target(
      name: "PangaeaClient",
      dependencies: [
        "XMLCoder",
        "PromiseKit",
        .product(name: "PMKFoundation", package: "PMKFoundation"),
        .product(name: "ZSTD", package: "Elva"),
        .product(name: "Logging", package: "swift-log"),
        "Cache"
      ]
      //resources: []
    ),
    .testTarget(
        name: "PangaeaClientTests",
        dependencies: ["PangaeaClient"]),
    
    .target(
      name: "PangaeaClientCLI",
      dependencies: [
        "PangaeaClient",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "Logging", package: "swift-log"),
        "Rainbow",
      ]
      //resources: []
    ),
    .testTarget(
        name: "PangaeaClientCLITests",
        dependencies: ["PangaeaClientCLI"]),
  ]
)
