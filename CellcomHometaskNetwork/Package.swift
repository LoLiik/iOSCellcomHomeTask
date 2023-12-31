// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CellcomHometaskNetwork",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CellcomHometaskNetwork",
            targets: ["CellcomHometaskNetwork"]),
    ],
    dependencies: [
        .package(path: "../CellcomHometaskModels"),
        .package(path: "../CellcomHometaskProtocols"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CellcomHometaskNetwork",
            dependencies: [
                "CellcomHometaskModels",
                "CellcomHometaskProtocols",
            ]
        ),
        .testTarget(
            name: "CellcomHometaskNetworkTests",
            dependencies: [
                "CellcomHometaskNetwork",
                "CellcomHometaskModels",
                "CellcomHometaskProtocols",
            ]
        ),
    ]
)
