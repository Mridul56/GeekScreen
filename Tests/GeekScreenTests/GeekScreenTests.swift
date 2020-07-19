import XCTest
@testable import GeekScreen

final class GeekScreenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GeekScreen().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
