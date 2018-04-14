// swift-tools-version:4.0
//
//  Package.swift
//  Vifra
//
//  Created by Matis Schotte on 19.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "Vifra",
    products: [
        .library(
            name: "Vifra",
            targets: ["Vifra", "Vifra (watchOS)"]
        )
    ],
    targets: [
        .target(
            name: "Vifra",
            sources: ["*.swift", "macOS/*"]
        ),
        .target(
            name: "Vifra (watchOS)",
            sources: ["*.swift", "watchOS/*"]
        ),
        .testTarget(
            name: "VifraTests",
            path: "Tests/macOS",
            dependencies: ["Vifra"]
        )
    ]
)
