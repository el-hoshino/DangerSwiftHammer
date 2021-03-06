// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DangerSwiftHammer",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DangerSwiftHammer",
            targets: ["DangerSwiftHammer"]),
        .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]), // dev
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"),
        // Dev dependencies
        .package(url: "https://github.com/f-meloni/danger-swift-xcodesummary.git", from: "1.0.0"), // dev
        .package(url: "https://github.com/f-meloni/danger-swift-coverage.git", from: "1.0.0"), // dev
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DangerSwiftHammer",
            dependencies: ["Danger"]),
        .testTarget(
            name: "DangerSwiftHammerTests",
            dependencies: ["DangerSwiftHammer"]),
        .target(name: "DangerDependencies", dependencies: ["Danger", "DangerXCodeSummary", "DangerSwiftCoverage"]), // dev
    ]
)
