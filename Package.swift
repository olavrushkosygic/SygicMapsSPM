// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SygicMaps",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SygicMaps",
            targets: ["SygicMapsDependencyWrapper", "SygicMaps"]),
    ],
    dependencies: [
        .package(
            name: "SygicAuth",
            url: "https://github.com/olavrushkosygic/SygicAuthSPM.git",
            .upToNextMajor(from: "1.3.1")
        )
    ],
    targets: [
        .target(
            name: "SygicMapsDependencyWrapper",
            dependencies: [
                .product(name: "SygicAuth", package: "SygicAuth")
            ]),
        .binaryTarget(
            name: "SygicMaps",
            url: "https://public.repo.sygic.com/repository/maven-sygic-releases/com/sygic/sdk/maps-ios/21.0.3/maps-ios-21.0.3.zip",
            checksum: "563810da6346230ac984894709fa4dc2d0a61cdcb100f6e511d6070121a5e258")
    ]
)
