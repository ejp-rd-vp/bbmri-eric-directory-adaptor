// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "bbmri-eric-directory-adaptor",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(name: "bbmri-eric-directory-adaptor", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/esthervanenckevort/MolgenisClientSwift.git", .branch("master"))
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "MolgenisClient"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

