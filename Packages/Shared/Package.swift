// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Shared",
    defaultLocalization: "en",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [.library(name: "Shared", targets: ["Shared"])],
    targets: [
        .target(name: "Shared", path: "Sources"),
        .testTarget(name: "SharedTests", dependencies: ["Shared"], path: "Tests"),
    ]
)
