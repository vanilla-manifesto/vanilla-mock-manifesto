// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VanillaMockExample",
    products: [
        .library(
            name: "VanillaMockExample",
            targets: ["VanillaMockExample"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "VanillaMockExample",
            dependencies: []),
        .testTarget(
            name: "VanillaMockExampleTests",
            dependencies: ["VanillaMockExample"]),
    ]
)
