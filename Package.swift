//  swift-tools-version: 5.7
//
//  Package.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import PackageDescription

/// The PigeonApp package.
let package = Package(
    name: "PigeonApp",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "PigeonApp",
            targets: ["PigeonApp"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.2.2"),
        .package(url: "https://github.com/david-swift/SettingsKit-macOS", from: "0.1.9"),
        .package(url: "https://github.com/david-swift/ActionKit-macOS", from: "0.1.6"),
        .package(url: "https://github.com/supabase-community/supabase-swift", .upToNextMajor(from: "0.2.1"))
    ],
    targets: [
        .target(
            name: "PigeonApp",
            dependencies: [
                .product(name: "SettingsKit", package: "SettingsKit-macOS"),
                .product(name: "ActionKit", package: "ActionKit-macOS"),
                .product(name: "Supabase", package: "supabase-swift")
            ],
            resources: [
                .process("Resources")
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),
        .testTarget(
            name: "PigeonAppTests",
            dependencies: ["PigeonApp"],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        )
    ]
)
