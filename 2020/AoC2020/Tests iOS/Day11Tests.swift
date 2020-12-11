
import XCTest
@testable import AoC2020


class Day11Tests: XCTestCase {

    let input = [
        "L.LL.LL.LL",
        "LLLLLLL.LL",
        "L.L.L..L..",
        "LLLL.LL.LL",
        "L.LL.LL.LL",
        "L.LLLLL.LL",
        "..L.L.....",
        "LLLLLLLLLL",
        "L.LLLLLL.L",
        "L.LLLLL.LL",
    ]

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let sut = SeatingSystem()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 37)
    }

}
