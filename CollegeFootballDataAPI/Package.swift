// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "CollegeFootballDataAPI",
    platforms: [
        .macOS(.v12), .iOS(.v15)
    ],
    products: [
        .library(
            name: "CollegeFootballDataAPI",
            targets: ["CollegeFootballDataAPI"]),
    ],
    dependencies: [
            // Add your local dependency here
            .package(path: "../CollegeFootballDataInterface")
        ],
    targets: [
        .target(
            name: "CollegeFootballDataAPI",
            dependencies: ["CollegeFootballDataInterface"]),
        .testTarget(
            name: "CollegeFootballDataAPITests",
            dependencies: ["CollegeFootballDataAPI", "CollegeFootballDataInterface"],
            resources: [.process("MockResponses/")])

    ]
)
