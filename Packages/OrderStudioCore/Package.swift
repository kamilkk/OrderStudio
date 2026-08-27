// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "OrderStudioCore",
    defaultLocalization: "en",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [.library(name: "OrderStudioCore", targets: ["OrderStudioCore"])],
    dependencies: [.package(path: "../Shared")],
    targets: [
        .target(name: "OrderStudioCore", dependencies: ["Shared"], path: "Sources/OrderStudioCore"),
        .testTarget(name: "OrderStudioCoreTests", dependencies: ["OrderStudioCore"], path: "Tests/OrderStudioCoreTests"),
    ]
)
