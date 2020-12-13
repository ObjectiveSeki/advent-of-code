
import XCTest
@testable import AoC2020


class Day12Tests: XCTestCase {

    let input = [
        "F10",
        "N3",
        "F7",
        "R90",
        "F11",
    ]

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let sut = RainRisk()
        let result = sut.calculate1(input)
        XCTAssertEqual(result, 25)
    }

    func testTwo() throws {
        let sut = RainRisk()
        let result = sut.calculate2(input)
        XCTAssertEqual(result, 286)
    }

}
