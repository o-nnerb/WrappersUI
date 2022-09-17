// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WrappersUI",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "WrappersUI",
            targets: ["WrappersUI"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/brennobemoura/AnchorKit",
            from: "0.0.2"
        )
    ],
    targets: [
        .target(
            name: "WrappersUI",
            dependencies: ["AnchorKit"]
        ),
        .testTarget(
            name: "WrappersUITests",
            dependencies: ["WrappersUI"]
        )
    ]
)
