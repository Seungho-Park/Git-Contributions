// swift-tools-version: 5.10
@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: ["RxSwift": .staticFramework]
    )
#endif

let package = Package(
    name: "Git-Contributions",
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/layoutBox/PinLayout.git", .upToNextMajor(from: "1.10.5")),
        .package(url: "https://github.com/layoutBox/FlexLayout.git", .upToNextMajor(from: "1.3.18"))
    ]
)
