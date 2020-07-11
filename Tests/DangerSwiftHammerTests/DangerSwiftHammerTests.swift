import XCTest
@testable import DangerSwiftHammer

final class DangerSwiftHammerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DangerSwiftHammer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
