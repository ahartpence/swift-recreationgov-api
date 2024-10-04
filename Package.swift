// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-recreationgov-api",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SwiftRecGovApi",
            targets: ["SwiftRecGovApi"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftRecGovApi"
        ),
        .testTarget(
            name: "swift-recreationgov-apiTests",
            dependencies: ["SwiftRecGovApi"]
        ),
    ]
)
