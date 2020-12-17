
import XCTest
@testable import AoC2020


class Day15Tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let input = "0,3,6"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 436)
    }

    func testOne1() throws {
        let input = "1,3,2"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 1)
    }

    func testOne2() throws {
        let input = "2,1,3"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 10)
    }

    func testOne3() throws {
        let input = "1,2,3"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 27)
    }

    func testOn4() throws {
        let input = "2,3,1"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 78)
    }

    func testOn5() throws {
        let input = "3,2,1"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 438)
    }

    func testOn6() throws {
        let input = "3,1,2"
        let sut = RambunctiousRecitation()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 1836)
    }

}
