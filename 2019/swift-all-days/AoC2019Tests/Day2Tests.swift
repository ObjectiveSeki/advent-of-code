
import XCTest
@testable import AoC2019


class Day2Tests: XCTestCase {

    var sut: IntcodeProgram!

    override func setUp() {
        sut = IntcodeProgram()
    }

    override func tearDown() { }

    func test1() {
        let input = [1, 0, 0, 0, 99]
        let result = sut.execute(array: input)

        let expected = [2, 0, 0, 0, 99]
        XCTAssertEqual(result, expected)
    }

    func test2() {
        let input = [2, 3, 0, 3, 99]
        let result = sut.execute(array: input)

        let expected = [2, 3, 0, 6, 99]
        XCTAssertEqual(result, expected)
    }

    func test3() {
        let input = [2, 4, 4, 5, 99, 0]
        let result = sut.execute(array: input)

        let expected = [2, 4, 4, 5, 99, 9801]
        XCTAssertEqual(result, expected)
    }

    func test4() {
        let input = [1, 1, 1, 4, 99, 5, 6, 0, 99]
        let result = sut.execute(array: input)

        let expected = [30, 1, 1, 4, 2, 5, 6, 0, 99]
        XCTAssertEqual(result, expected)
    }

}
