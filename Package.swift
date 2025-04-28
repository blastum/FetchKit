// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchKit",
    platforms: [
        .iOS(.v15), // or lower if needed
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "FetchKit",
            targets: ["FetchKit"]
        )
    ],
    targets: [
        .target(
            name: "FetchKit",
            dependencies: []
        ),
        .testTarget(
            name: "FetchKitTests",
            dependencies: ["FetchKit"]
        )
    ]
)
