// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFormatDemo",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .plugin(name: "SwiftFormatPlugin", targets: ["SwiftFormatPlugin"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-format.git", exact: "0.50600.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SwiftFormatDemo",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftFormatDemoTests",
            dependencies: ["SwiftFormatDemo"]),
        .plugin(
            name: "SwiftFormatPlugin",
            capability: .command(
                intent: .custom(
                    verb: "swift-format-plugin",
                    description: "swift format plugin demo"),
                permissions: [.writeToPackageDirectory(reason: "for format")]
            ),
            dependencies: [
                "swift-format"
            ])
    ]
)
