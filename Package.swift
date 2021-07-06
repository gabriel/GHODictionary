// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GHODictionary",
    platforms: [
        .iOS(.v8), .tvOS(.v10), .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "GHODictionary",
            targets: ["GHODictionary"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GHODictionary",
            dependencies: [],
            path: "GHODictionary",
            exclude: ["Info.plist"],
            cSettings: [
                .headerSearchPath("include")
            ]),
        .testTarget(
            name: "GHODictionaryTests",
            dependencies: ["GHODictionary"],
            path: "GHODictionaryTests",
            exclude: ["Info.plist"]),
    ]
)
