
import XCTest
@testable import AoC2019


class Day3: XCTestCase {

    var sut: JumbleOfWires!

    override func setUp() {
        sut = JumbleOfWires()
    }

    override func tearDown() {
        sut = nil
    }


    // MARK: Part 1

    func test1() {
        let p1 = ["R8", "U5", "L5", "D3"]
        let p2 = ["U7", "R6", "D4", "L4"]
        sut.trace(path: p1, for: .wireOne)
        sut.trace(path: p2, for: .wireTwo)
        XCTAssertEqual(sut.distance(), 6)
    }

    func test2() {
        let p1 = ["R75","D30","R83","U83","L12","D49","R71","U7","L72"]
        let p2 = ["U62","R66","U55","R34","D71","R55","D58","R83"]
        sut.trace(path: p1, for: .wireOne)
        sut.trace(path: p2, for: .wireTwo)
        XCTAssertEqual(sut.distance(), 159)
    }

    func test3() {
        let p1 = ["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"]
        let p2 = ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]
        sut.trace(path: p1, for: .wireOne)
        sut.trace(path: p2, for: .wireTwo)
        XCTAssertEqual(sut.distance(), 135)
    }


    // MARK: Part 2

    func test4() {
        let p1 = ["R8", "U5", "L5", "D3"]
        let p2 = ["U7", "R6", "D4", "L4"]
        sut.trace(path: p1, for: .wireOne)
        sut.trace(path: p2, for: .wireTwo)
        XCTAssertEqual(sut.steps(), 30)
    }

    func test5() {
        let p1 = ["R75","D30","R83","U83","L12","D49","R71","U7","L72"]
        let p2 = ["U62","R66","U55","R34","D71","R55","D58","R83"]
        sut.trace(path: p1, for: .wireOne)
        sut.trace(path: p2, for: .wireTwo)
        XCTAssertEqual(sut.steps(), 610)
    }

    func test6() {
        let p1 = ["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"]
        let p2 = ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]
        sut.trace(path: p1, for: .wireOne)
        sut.trace(path: p2, for: .wireTwo)
        XCTAssertEqual(sut.steps(), 410)
    }
}
