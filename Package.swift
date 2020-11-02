// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "LayoutItKit",
    platforms: [
        .iOS(.v11)
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
