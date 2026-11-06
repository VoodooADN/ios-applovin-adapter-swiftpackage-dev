// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: Constants.adapterName,
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: Constants.adapterName,
            targets: [Constants.adapterName])
    ],
    dependencies: [
        // The adapter is built against this exact SDK version and ships with it.
        .package(url: Constants.sdkPackageURL, exact: Constants.sdkVersion),
        .package(url: Constants.appLovinPackageURL, .upToNextMajor(from: Constants.appLovinMinimumVersion))
    ],
    targets: [
        .target(
            name: Constants.adapterName,
            dependencies: [
                .product(name: "VoodooAdn", package: Constants.sdkPackageName),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package")
            ]
        )
    ]
)

enum Constants {
    static var adapterName: String { "VoodooMaxAdapter" }
    static var sdkPackageURL: String { "https://github.com/VoodooADN/ios-sdk-swiftpackage-dev.git" }
    static var sdkPackageName: String { "ios-sdk-swiftpackage-dev" }
    static var sdkVersion: Version { "4.32.0-maxspm2.g8943846" }
    static var appLovinPackageURL: String { "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git" }
    static var appLovinMinimumVersion: Version { "13.0.0" }
}
