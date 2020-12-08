
import XCTest
@testable import AoC2020


class Day8Tests: XCTestCase {

    let input = [
        "nop +0",
        "acc +1",
        "jmp +4",
        "acc +3",
        "jmp -3",
        "acc -99",
        "acc +1",
        "jmp -4",
        "acc +6",
    ]

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let sut = HandheldHalting()
        let result = sut.calculate(from: input)
        XCTAssertEqual(result, 5)
    }

    func testTwo() throws {
        let sut = HandheldHalting()
        let result = sut.calculate2(from: input)
        XCTAssertEqual(result, 8)
    }

}
