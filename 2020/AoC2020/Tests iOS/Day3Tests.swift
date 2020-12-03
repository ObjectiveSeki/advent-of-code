
import XCTest
@testable import AoC2020


class Day3Tests: XCTestCase {

    let input = [
        "..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#",
    ]
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOne() throws {
        let sut = TobogganTrajectory()
        let result = sut.calculateTrees(input: input, increment: (3,1))
        XCTAssertEqual(result, 7)
    }

    func testTwo() throws {
        let sut = TobogganTrajectory()
        let result1 = sut.calculateTrees(input: input, increment: (1,1))
        let result2 = sut.calculateTrees(input: input, increment: (3,1))
        let result3 = sut.calculateTrees(input: input, increment: (5,1))
        let result4 = sut.calculateTrees(input: input, increment: (7,1))
        let result5 = sut.calculateTrees(input: input, increment: (1,2))
        let result = result1 * result2 * result3 * result4 * result5
        XCTAssertEqual(result, 336)
    }

}
