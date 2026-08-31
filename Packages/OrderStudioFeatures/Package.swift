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
        .package(url: "https://github.com/kamilkk/ModernDesignSystem", from: "1.2.0"),
    ],
    targets: [
        .target(name: "OrderStudioFeatures",
                dependencies: ["OrderStudioCore", "OrderStudioUI",
                               .product(name: "ModernDesignSystem", package: "ModernDesignSystem")],
                path: "Sources"),
        .testTarget(name: "OrderStudioFeaturesTests", dependencies: ["OrderStudioFeatures"], path: "Tests"),
    ]
)
