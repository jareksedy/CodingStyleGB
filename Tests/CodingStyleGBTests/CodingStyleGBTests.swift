import XCTest
import SwiftUI
@testable import CodingStyleGB

final class CodingStyleGBTests: XCTestCase {
    
    @CodingStyleGB(style: .SnakeCase) var testSnake = "test snake case"
    @CodingStyleGB(style: .CamelCase) var testCamel = "Camel test"
    @CodingStyleGB(style: .KebabCase) var testKebab = "How about some kebab?"
    
    func testCodingStyleGB() throws {
        XCTAssertEqual(testSnake, "test_snake_case")
        XCTAssertEqual(testCamel, "CamelTest")
        XCTAssertEqual(testKebab, "how-about-some-kebab?")
    }
}
