// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SygicMaps",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SygicMaps",
            targets: ["SygicMaps"]),
    ],
    dependencies: [
        .package(url: "https://github.com/olavrushkosygic/SygicAuthSPM.git", .upToNextMajor(from: "1.3.1"))
    ],
    targets: [
        .binaryTarget(
            name: "SygicMaps",
            url: "https://public.repo.sygic.com/repository/maven-sygic-releases/com/sygic/sdk/maps-ios/21.0.3/maps-ios-21.0.3.zip",
            checksum: "563810da6346230ac984894709fa4dc2d0a61cdcb100f6e511d6070121a5e258")
    ]
)
