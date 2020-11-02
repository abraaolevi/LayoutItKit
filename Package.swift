// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "LayoutItKit",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "LayoutItKit",
            targets: ["LayoutItKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LayoutItKit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "LayoutItKitTests",
            dependencies: ["LayoutItKit"],
            path: "Tests"
        ),
    ]
)
