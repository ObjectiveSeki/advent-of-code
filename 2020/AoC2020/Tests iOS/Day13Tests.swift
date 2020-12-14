
import XCTest
@testable import AoC2020


class Day13Tests: XCTestCase {

    let input = [
        "939",
        "7,13,x,x,59,x,31,19",
    ]
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testOne() throws {
        let sut = ShuttleSearch()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 295)
    }

    func testTwo() throws {
        let sut = ShuttleSearch()
        let result = sut.calculate2(input)
        XCTAssertEqual(result, 1068781)
    }

    func testThree() throws {
        let input = [
            "",
            "17,x,13,19",
        ]
        let sut = ShuttleSearch()
        let result = sut.calculate2(input)
        XCTAssertEqual(result, 3417)
    }

}
