
import XCTest
@testable import AoC2019


class Day6Tests: XCTestCase {

    var sut: OrbiterCalculator!

    override func setUp() {
        let input = """
        COM)B
        B)C
        C)D
        D)E
        E)F
        B)G
        G)H
        D)I
        E)J
        J)K
        K)L
        """
        let orbits = input.components(separatedBy: .newlines)
        sut = OrbiterCalculator(orbits: orbits)
    }

    override func tearDown() {
    }


    // MARK: Part 1

    func test1() {
        XCTAssertEqual(sut.orbitCount(from: "D", to: "COM"), 3)
    }

    func test2() {
        XCTAssertEqual(sut.orbitCount(from: "L", to: "COM"), 7)
    }

    func test3() {
        XCTAssertEqual(sut.orbitCount(from: "COM", to: "COM"), 0)
    }

    func test4() {
        XCTAssertEqual(sut.totalOrbitCount(), 42)
    }


    // MARK: Part 2

    func test5() {
        let input = """
        COM)B
        B)C
        C)D
        D)E
        E)F
        B)G
        G)H
        D)I
        E)J
        J)K
        K)L
        K)YOU
        I)SAN
        """
        let orbits = input.components(separatedBy: .newlines)
        sut = OrbiterCalculator(orbits: orbits)
        XCTAssertEqual(sut.orbitCountMeToSanta(), 4)
    }
}
