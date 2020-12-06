
import XCTest
@testable import AoC2020

class Day6Tests: XCTestCase {

    let input = [
        "abc",
        "",
        "a",
        "b",
        "c",
        "",
        "ab",
        "ac",
        "",
        "a",
        "a",
        "a",
        "a",
        "",
        "b",
    ]
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let sut = CustomCustoms()
        let result = sut.countNumberOfQuestions(from: input)
        XCTAssertEqual(result, 11)
    }

    func testTwo() throws {
        let sut = CustomCustoms()
        let result = sut.countEveryoneAnsweredYes(from: input)
        XCTAssertEqual(result, 6)
    }

}
