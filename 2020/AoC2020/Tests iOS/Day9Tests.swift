
import XCTest
@testable import AoC2020


class Day9Tests: XCTestCase {

    let input = [
        "35",
        "20",
        "15",
        "25",
        "47",
        "40",
        "62",
        "55",
        "65",
        "95",
        "102",
        "117",
        "150",
        "182",
        "127",
        "219",
        "299",
        "277",
        "309",
        "576",
    ]

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testOne() throws {
        let sut = EncodingError()
        let result = sut.calculate1Slow(input, 5)
        XCTAssertEqual(result, 127)
    }

    func testTwo() throws {
        let sut = EncodingError()
        let result = sut.calculate1Fast(input, 5)
        XCTAssertEqual(result, 127)
    }

    func testThree() throws {
        let sut = EncodingError()
        let result = sut.calculate2Slow(input, 5)
        XCTAssertEqual(result, 62)
    }

    func testFour() throws {
        let sut = EncodingError()
        let result = sut.calculate2Fast(input, 5)
        XCTAssertEqual(result, 62)
    }

}
