import XCTest
@testable import SwiftCity

class SwiftCityTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwiftCity().text, "Hello, World!")
    }


    static var allTests : [(String, (SwiftCityTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
