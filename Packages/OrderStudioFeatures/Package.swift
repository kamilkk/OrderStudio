// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "OrderStudioFeatures",
    defaultLocalization: "en",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [.library(name: "OrderStudioFeatures", targets: ["OrderStudioFeatures"])],
    dependencies: [
        .package(path: "../OrderStudioCore"),
        .package(path: "../OrderStudioUI"),
    ],
    targets: [
        .target(name: "OrderStudioFeatures", dependencies: ["OrderStudioCore", "OrderStudioUI"], path: "Sources"),
        .testTarget(name: "OrderStudioFeaturesTests", dependencies: ["OrderStudioFeatures"], path: "Tests"),
    ]
)
