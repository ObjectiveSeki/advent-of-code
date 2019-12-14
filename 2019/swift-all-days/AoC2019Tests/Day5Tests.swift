
import XCTest
@testable import AoC2019


class Day5: XCTestCase {


    // MARK: Part 1

    func test1() {
        var sut = IntcodeComputer()
        let program = [3, 0, 4, 0, 99]
        sut.input = 42
        let _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [42])
    }

    func test2() {
        var sut = IntcodeComputer()
        let program = [1002, 4, 3, 4, 33]
        let result = sut.execute(program: program)

        let expected = [1002, 4, 3, 4, 99]
        XCTAssertEqual(result, expected)
    }

    func test3() {
        var sut = IntcodeComputer()
        let program = [11002, 3, 2, 4, 99]
        let result = sut.execute(program: program)

        let expected = [11002, 3, 2, 8, 99]
        XCTAssertEqual(result, expected)
    }

    func test4() {
        var sut = IntcodeComputer()
        let program = [1001, 4, 66, 4, 33]
        let result = sut.execute(program: program)

        let expected = [1001, 4, 66, 4, 99]
        XCTAssertEqual(result, expected)
    }

    func test5() {
        var sut = IntcodeComputer()
        let program = [11001, 3, 2, 4, 99]
        let result = sut.execute(program: program)

        let expected = [11001, 3, 2, 6, 99]
        XCTAssertEqual(result, expected)
    }

    func test6() {
        var sut = IntcodeComputer()
        let program = [1101, 100, -1, 4, 0]
        let result = sut.execute(program: program)

        let expected = [1101, 100, -1, 4, 99]
        XCTAssertEqual(result, expected)
    }


    // MARK: Part 2

    func test7() {
        var sut = IntcodeComputer()
        let program = [3,9,8,9,10,9,4,9,99,-1,8]
        sut.input = 8
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1])
    }

    func test8() {
        var sut = IntcodeComputer()
        let program = [3,9,8,9,10,9,4,9,99,-1,8]
        sut.input = 8234
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [0])
    }

    func test9() {
        var sut = IntcodeComputer()
        let program = [3,9,7,9,10,9,4,9,99,-1,8]
        sut.input = 7
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1])
    }

    func test10() {
        var sut = IntcodeComputer()
        let program = [3,9,7,9,10,9,4,9,99,-1,8]
        sut.input = 8234
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [0])
    }

    func test11() {
        var sut = IntcodeComputer()
        let program = [3,3,1108,-1,8,3,4,3,99]
        sut.input = 8
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1])
    }

    func test12() {
        var sut = IntcodeComputer()
        let program = [3,3,1108,-1,8,3,4,3,99]
        sut.input = 8234
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [0])
    }

    func test13() {
        var sut = IntcodeComputer()
        let program = [3,3,1107,-1,8,3,4,3,99]
        sut.input = 7
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1])
    }

    func test14() {
        var sut = IntcodeComputer()
        let program = [3,3,1107,-1,8,3,4,3,99]
        sut.input = 8234
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [0])
    }

    func test15() {
        var sut = IntcodeComputer()
        let program = [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]
        sut.input = 0
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [0])
    }

    func test16() {
        var sut = IntcodeComputer()
        let program = [3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9]
        sut.input = 8234
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1])
    }

    func test17() {
        var sut = IntcodeComputer()
        let program = [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]
        sut.input = 0
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [0])
    }

    func test18() {
        var sut = IntcodeComputer()
        let program = [3,3,1105,-1,9,1101,0,0,12,4,12,99,1]
        sut.input = 8234
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1])
    }

    func test19() {
        var sut = IntcodeComputer()
        let program = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
        sut.input = 7
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [999])
    }

    func test20() {
        var sut = IntcodeComputer()
        let program = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
        sut.input = 8
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1000])
    }

    func test21() {
        var sut = IntcodeComputer()
        let program = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
        1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
        999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
        sut.input = 9
        _ = sut.execute(program: program)
        XCTAssertEqual(sut.outputs, [1001])
    }

}
