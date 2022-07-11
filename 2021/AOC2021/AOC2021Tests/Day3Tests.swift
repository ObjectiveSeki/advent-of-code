
import XCTest
@testable import AOC2021

final class Day3Tests: XCTestCase {

    let diagnostic = [
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010",
    ]
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test1() throws {
        let sut = BinaryDiagnostic()
        let result = sut.powerConsumption(diagnostic)
        XCTAssertEqual(result, 198)
    }

    func test2() throws {
        let sut = BinaryDiagnostic()
        let result = sut.selectByBitCriteria(diagnostic, .most)
        XCTAssertEqual(result, ["10111"])
    }
    func test3() throws {
        let sut = BinaryDiagnostic()
        let result = sut.selectByBitCriteria(diagnostic, .least)
        XCTAssertEqual(result, ["01010"])
    }

    func test4() throws {
        let sut = BinaryDiagnostic()
        let result = sut.lifeSupportRating(diagnostic)
        XCTAssertEqual(result, 230)
    }

    func testPart1() throws {
        let sut = BinaryDiagnostic(inputFile: "InputDay3")
        let result = sut.generatePartOne()
        XCTAssertEqual(result, String(4138664))
    }

    func testPart2() throws {
        let sut = BinaryDiagnostic(inputFile: "InputDay3")
        let result = sut.generatePartTwo()
        XCTAssertEqual(result, String(4273224))
    }

}
