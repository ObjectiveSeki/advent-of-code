
import XCTest
@testable import AoC2020


class Day10Tests: XCTestCase {

    let input1 = [
        "16",
        "10",
        "15",
        "5",
        "1",
        "11",
        "7",
        "19",
        "6",
        "12",
        "4",
    ]
    let input2 = [
        "28",
        "33",
        "18",
        "42",
        "31",
        "14",
        "46",
        "20",
        "48",
        "47",
        "24",
        "23",
        "49",
        "45",
        "19",
        "38",
        "39",
        "11",
        "1",
        "32",
        "25",
        "35",
        "8",
        "17",
        "7",
        "9",
        "4",
        "2",
        "34",
        "10",
        "3",
    ]

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let sut = AdapterArray()
        let result = sut.calculateDiffs(input1)
        XCTAssertEqual(result.diff1, 7)
        XCTAssertEqual(result.diff3, 5)
    }

    func testNwo() throws {
        let sut = AdapterArray()
        let result = sut.calculateDiffs(input2)
        XCTAssertEqual(result.diff1, 22)
        XCTAssertEqual(result.diff3, 10)
    }

    func testThree() throws {
        let sut = AdapterArray()
        let result = sut.calculate2(input1)
        XCTAssertEqual(result, 8)
    }

    func testFour() throws {
        let sut = AdapterArray()
        let result = sut.calculate2(input2)
        XCTAssertEqual(result, 19208)
    }

}
