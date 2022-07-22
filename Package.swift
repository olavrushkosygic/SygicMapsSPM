// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let fullVersion = "21.1.0-nightly.20220721.826"
let packageChecksum = "3f7f50c70dc5aa85fbb16de992eb9301e903d70dbacc866d4d3b6bae6eea20fb"

let publicUrl = "https://public.repo.sygic.com/repository/maven-sygic-releases/com/sygic/sdk/maps-ios/\(fullVersion)/maps-ios-\(fullVersion).zip"
let internalUrl = "https://repository.sygic.com/repository/maven-public/com/sygic/sdk/maps-ios/\(fullVersion)/maps-ios-\(fullVersion).zip"

let packageUrl = internalUrl

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
            url: packageUrl,
            checksum: packageChecksum)
    ]
)
