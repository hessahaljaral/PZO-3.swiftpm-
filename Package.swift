// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "PZO",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "PZO",
            targets: ["AppModule"],
            bundleIdentifier: "h.PZO",
            teamIdentifier: "T96JD555QP",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .education
        )
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", "4.4.0"..<"5.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
