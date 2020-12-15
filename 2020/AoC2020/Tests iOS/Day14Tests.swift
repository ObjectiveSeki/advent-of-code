
import XCTest
@testable import AoC2020


class Day14Tests: XCTestCase {

    let input = [
        "mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X",
        "mem[8] = 11",
        "mem[7] = 101",
        "mem[8] = 0",
    ]
    let input2 = [
        "mask = 000000000000000000000000000000X1001X",
        "mem[42] = 100",
        "mask = 00000000000000000000000000000000X0XX",
        "mem[26] = 1",
    ]

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testOne() throws {
        let sut = DockingData()
        let result = sut.calculate(input)
        XCTAssertEqual(result, 165)
    }

    func testTwo() throws {
        let sut = DockingData()
        let result = sut.calculate2(input2)
        XCTAssertEqual(result, 208)
    }

}
