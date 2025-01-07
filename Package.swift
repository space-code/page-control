// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "page-control",
    products: [
        .library(name: "PageControl", targets: ["PageControl"]),
    ],
    targets: [
        .target(name: "PageControl"),
        .testTarget(name: "PageControlTests", dependencies: ["PageControl"]),
    ]
)
