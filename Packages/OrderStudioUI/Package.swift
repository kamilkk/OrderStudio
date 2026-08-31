// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "OrderStudioUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [.library(name: "OrderStudioUI", targets: ["OrderStudioUI"])],
    dependencies: [
        .package(path: "../OrderStudioCore"),
        .package(url: "https://github.com/kamilkk/ModernDesignSystem", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "OrderStudioUI",
            dependencies: [
                "OrderStudioCore",
                .product(name: "ModernDesignSystem", package: "ModernDesignSystem"),
            ],
            path: "Sources"
        ),
        .testTarget(name: "OrderStudioUITests", dependencies: ["OrderStudioUI"], path: "Tests"),
    ]
)
