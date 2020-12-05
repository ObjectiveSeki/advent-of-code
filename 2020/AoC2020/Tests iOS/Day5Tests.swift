
import XCTest
@testable import AoC2020


class Day5Tests: XCTestCase {

    let sut = BinaryBoarding()

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let result = sut.calculateSeatID(from: "FBFBBFFRLR")
        XCTAssertEqual(result, 357)

        let result2 = sut.calculateSeatID(from: "BFFFBBFRRR")
        XCTAssertEqual(result2, 567)

        let result3 = sut.calculateSeatID(from: "FFFBBBFRRR")
        XCTAssertEqual(result3, 119)

        let result4 = sut.calculateSeatID(from: "BBFFBBFRLL")
        XCTAssertEqual(result4, 820)
    }

    func testTwo() throws {
        let input = [
            "FBFBBFFRLR",
            "BFFFBBFRRR",
            "FFFBBBFRRR",
            "BBFFBBFRLL",
        ]
        let result = sut.highestSeatID(from: input)
        XCTAssertEqual(result, 820)
    }

}
