
import XCTest
@testable import AOC2021

final class Day2Tests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test1() throws {
        let sut = Drive()
        let commandList = [
            Command(direction: .forward, units: 5),
            Command(direction: .down, units: 5),
            Command(direction: .forward, units: 8),
            Command(direction: .up, units: 3),
            Command(direction: .down, units: 8),
            Command(direction: .forward, units: 2),
        ]
        let result = sut.followInstructions(commandList)
        XCTAssertEqual(result, 150)
    }

    func test2() throws {
        var sut = Drive()
        let commandList = [
            "forward 5",
            "down 5",
            "forward 8",
            "up 3",
            "down 8",
            "forward 2",
        ]
        sut.makeInstructions(commandList)
        let result = sut.followInstructions(sut.instructions!)
        XCTAssertEqual(result, 150)
    }

    func test3() throws {
        let sut = Drive()
        let commandList = [
            Command(direction: .forward, units: 5),
            Command(direction: .down, units: 5),
            Command(direction: .forward, units: 8),
            Command(direction: .up, units: 3),
            Command(direction: .down, units: 8),
            Command(direction: .forward, units: 2),
        ]
        let result = sut.followInstructionsWithAim(commandList)
        XCTAssertEqual(result, 900)
    }

    func testPart1() throws {
        let sut = Drive(inputFile: "InputDay2")
        let result = sut.generatePartOne()
        XCTAssertEqual(result, String(1484118))
    }

    func testPart2() throws {
        let sut = Drive(inputFile: "InputDay2")
        let result = sut.generatePartTwo()
        XCTAssertEqual(result, String(1463827010))
    }


}
