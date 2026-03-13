// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "P42ViewModifiers",
    platforms: [
        .iOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        .library(
            name: "P42ViewModifiers",
            targets: ["P42ViewModifiers"]),
    ],
    targets: [
        .target(
            name: "P42ViewModifiers")
    ]
)
