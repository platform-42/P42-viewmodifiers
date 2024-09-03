// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "P42-viewmodifiers",
    platforms: [
        .iOS(.v14),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "P42-viewmodifiers",
            targets: ["P42-viewmodifiers"]),
    ],
    targets: [
        .target(
            name: "P42-viewmodifiers"),
        .testTarget(
            name: "P42-viewmodifiersTests",
            dependencies: ["P42-viewmodifiers"]),
    ]
)
