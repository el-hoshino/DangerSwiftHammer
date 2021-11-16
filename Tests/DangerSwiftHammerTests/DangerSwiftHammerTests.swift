import XCTest
@testable import DangerSwiftHammer

final class DangerSwiftHammerTests: XCTestCase {
    
    func testDiffCommand() {
        
        let baseBranch: () -> String = { "base_branch" }
        let shellCommand: (String) -> String = { _ in XCTFail(); return "" }
        
        let hammer = Hammer(baseBranchResolver: baseBranch, shellCommandExecutor: shellCommand)
        let filename = "test.abc"
        
        let output = hammer.diffCommand(parsingFile: filename)
        let expectedOutput = #"git diff origin/base_branch -- "test.abc""#
        XCTAssertEqual(output, expectedOutput)
        
    }
        
    func testDiffPatch() {
        
        let baseBranch: () -> String = { "base_branch" }
        let shellCommand: (String) -> String = { "'\($0)' executed" }
        
        let hammer = Hammer(baseBranchResolver: baseBranch, shellCommandExecutor: shellCommand)
        let filename = "test.abc"
        
        let output = hammer.diffPatch(for: filename)
        let expectedOutput = #"'git diff origin/base_branch -- "test.abc"' executed"#
        XCTAssertEqual(output, expectedOutput)
        
    }
    
    func testDiffLines() {
        
        let baseBranch: () -> String = { "" }
        let shellCommand: (String) -> String = { _ in
            return """
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
            """
        }
        
        let hammer = Hammer(baseBranchResolver: baseBranch, shellCommandExecutor: shellCommand)
        
        let output = hammer.diffLines(in: "")
        let expectedOutput: (deletions: [String], additions: [String]) = (
            [
                #"-// swift-tools-version:5.2"#,
                #"-            dependencies: []),"#,
            ],
            [
                #"+// swift-tools-version:5.1"#,
                #"+        .package(url: "https://github.com/danger/swift.git", from: "3.0.0"),"#,
                #"+            dependencies: ["Danger"]),"#,
            ]
        )
        
        XCTAssertEqual(output.deletions, expectedOutput.deletions)
        XCTAssertEqual(output.additions, expectedOutput.additions)
        
    }
    
}
