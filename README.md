# DangerSwiftHammer

Handy properties and methods for Danger-Swift!

*Currently this package only have 2 methods, one to get patch text for a file, and one to get additions and deletions lines for a file.

## Install DangerSwiftHammer

### Marathon

- Add this to your `Dangerfile.swift`

```swift
import DangerSwiftHammer // package: https://github.com/el-hoshino/DangerSwiftHammer.git
```

- Run `danger-swift edit` from project directory and it should resolve the dependencies automatically.

- (Recommended) Cache the `~/.danger-swift` folder

## Usage

```swift
let danger = Danger()
danger.hammer.//...
```

### Get patch text for file

```swift
let danger = Danger()
//...

let file = pathToFile
let patch = danger.hammer.diffPatch(for: file)
/*
 index 4888aaa..4c293b9 100644
 --- a/Package.swift
 +++ b/Package.swift
 @@ -1,4 +1,4 @@
 -// swift-tools-version:5.2
 +// swift-tools-version:5.1
  // The swift-tools-version declares the minimum version of Swift required to build this package.
  
  import PackageDescription
 @@ -14,13 +14,14 @@ let package = Package(
      dependencies: [
          // Dependencies declare other packages that this package depends on.
          // .package(url: /* package url */, from: "1.0.0"),
 +        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"),
      ],
      targets: [
          // Targets are the basic building blocks of a package. A target can define a module or a test suite.
          // Targets can depend on other targets in this package, and on products in packages which this package depends on.
          .target(
              name: "DangerSwiftHammer",
 -            dependencies: []),
 +            dependencies: ["Danger"]),
          .testTarget(
              name: "DangerSwiftHammerTests",
              dependencies: ["DangerSwiftHammer"]),
 */
// Do something with your patch
```

### Get additions and deletions lines for file

```swift
let danger = Danger()
//...

let file = pathToFile
let lines = danger.hammer.diffLines(in: file)
let additions = lines.additions
/*
 [
     #"-// swift-tools-version:5.2"#,
     #"-            dependencies: []),"#,
 ],
 */
let deletions = lines.deletions
/*
 [
     #"+// swift-tools-version:5.1"#,
     #"+        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"),"#,
     #"+            dependencies: ["Danger"]),"#,
 ]
 */
// Do something with your additions and deletions
```

## Having suggestions?

[Open an issue!](https://github.com/el-hoshino/DangerSwiftHammer/issues/new)

## Why is this package called "DangerSwiftHammer"?

"Everything can be fixed with a hammer." - Jeremy Clarkson
