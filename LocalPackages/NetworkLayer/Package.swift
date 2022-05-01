// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "NetworkLayer",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "NetworkLayer",
            targets: ["NetworkLayer"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NetworkLayer",
            dependencies: [],
            path: "Sources"
        )
    ]
)
