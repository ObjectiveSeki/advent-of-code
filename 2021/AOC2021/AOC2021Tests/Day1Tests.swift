
import XCTest
@testable import AOC2021

final class Day1Tests: XCTestCase {

    var sut: SonarSweep!
    let input =
    """
    199
    200
    208
    210
    200
    207
    240
    269
    260
    263
    """
    override func setUpWithError() throws {
        sut = SonarSweep()
    }

    override func tearDownWithError() throws {}

    func test1() throws {
        let array = input.components(separatedBy: .newlines).map { Int($0)! }
        let result = sut.deptIncreases(list: array)
        XCTAssertEqual(result, 7)
    }
    func test2() throws {
        let array = input.components(separatedBy: .newlines).map { Int($0)! }
        let result = sut.deptWindowIncreases(list: array)
        XCTAssertEqual(result, 5)
    }

    func testPart1() throws {
        let sut = SonarSweep(inputFile: "InputDay1")
        let result = sut.generatePartOne()
        XCTAssertEqual(result, String(1602))
    }

    func testPart2() throws {
        let sut = SonarSweep(inputFile: "InputDay1")
        let result = sut.generatePartTwo()
        XCTAssertEqual(result, String(1633))
    }

}
