import XCTest
@testable import DangerSwiftHammer

final class DangerSwiftHammerTests: XCTestCase {
    
    func testDiffCommand() {
        
        struct StubDanger: DangerData {
            func execShellCommand(_ command: String) -> String { "" }
        }
        
        let danger = StubDanger()
        let hammer = DangerSwiftHammer(danger: danger)
        let filename = "test.abc"
        
        let output = hammer.diffCommand(parsingFile: filename)
        let expectedOutput = #"git diff -- "test.abc""#
        XCTAssertEqual(output, expectedOutput)
        
    }
        
    func testDiffPatch() {
        
        struct StubDanger: DangerData {
            func execShellCommand(_ command: String) -> String {
                return "'\(command)' executed"
            }
        }
        
        let danger = StubDanger()
        let hammer = DangerSwiftHammer(danger: danger)
        let filename = "test.abc"
        
        let output = hammer.diffPatch(for: filename)
        let expectedOutput = #"'git diff -- "test.abc"' executed"#
        XCTAssertEqual(output, expectedOutput)
        
    }
    
}
