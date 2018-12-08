import XCTest
@testable import AllDays


class Day3Tests: XCTestCase {

    var sut: FabricGuru!

    override func setUp() {
        sut = FabricGuru(size: (x: 8, y: 8))
    }

    override func tearDown() {
        sut = nil
    }

    func testRectangleParse1() {
        let s = "#1 @ 1,3: 4x4"
        let result = sut.makeRectangle(from: s)
        let expected = Rectangle(ID: 1, position: (1, 3), size: (4, 4), claimed: false)
        XCTAssertEqual(result, expected)
    }

    func testRectangleParse2() {
        let s = "#53 @ 680,571: 19x19"
        let result = sut.makeRectangle(from: s)
        let expected = Rectangle(ID: 53, position: (680, 571), size: (19, 19), claimed: false)
        XCTAssertEqual(result, expected)
    }

    func testRectangleInGrid3() {
        let s3 = "#3 @ 5,5: 2x2"
        let rectangle = sut.makeRectangle(from: s3)
        sut.plot(rectangle)

        let expected = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", "3", "3", "."],
            [".", ".", ".", ".", ".", "3", "3", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
        ]
        XCTAssertEqual(sut.matrix, expected)
    }

    func testRectangleInGrid23() {
        let s2 = "#2 @ 3,1: 4x4"
        let s3 = "#3 @ 5,5: 2x2"
        let rectangle2 = sut.makeRectangle(from: s2)
        let rectangle3 = sut.makeRectangle(from: s3)

        sut.plot(rectangle2)
        sut.plot(rectangle3)

        let expected = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", "2", "2", "2", "2", "."],
            [".", ".", ".", "2", "2", "2", "2", "."],
            [".", ".", ".", "2", "2", "2", "2", "."],
            [".", ".", ".", "2", "2", "2", "2", "."],
            [".", ".", ".", ".", ".", "3", "3", "."],
            [".", ".", ".", ".", ".", "3", "3", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
        ]
        XCTAssertEqual(sut.matrix, expected)
    }

    func testRectangleInGrid123() {
        let s1 = "#1 @ 1,3: 4x4"
        let s2 = "#2 @ 3,1: 4x4"
        let s3 = "#3 @ 5,5: 2x2"
        let rectangle1 = sut.makeRectangle(from: s1)
        let rectangle2 = sut.makeRectangle(from: s2)
        let rectangle3 = sut.makeRectangle(from: s3)

        sut.plot(rectangle1)
        sut.plot(rectangle2)
        sut.plot(rectangle3)

        for array in sut.matrix {
            print(array)
        }
        let expected = [
            [".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", "2", "2", "2", "2", "."],
            [".", ".", ".", "2", "2", "2", "2", "."],
            [".", "1", "1", "X", "X", "2", "2", "."],
            [".", "1", "1", "X", "X", "2", "2", "."],
            [".", "1", "1", "1", "1", "3", "3", "."],
            [".", "1", "1", "1", "1", "3", "3", "."],
            [".", ".", ".", ".", ".", ".", ".", "."],
        ]
        XCTAssertEqual(sut.matrix, expected)
    }

    func testOverlappingSquareInches() {
        let s1 = "#1 @ 1,3: 4x4"
        let s2 = "#2 @ 3,1: 4x4"
        let s3 = "#3 @ 5,5: 2x2"
        let rectangle1 = sut.makeRectangle(from: s1)
        let rectangle2 = sut.makeRectangle(from: s2)
        let rectangle3 = sut.makeRectangle(from: s3)

        sut.plot(rectangle1)
        sut.plot(rectangle2)
        sut.plot(rectangle3)

        let result = sut.overlappingSquareInches()
        XCTAssertEqual(result, 4)
    }

    func testClaimNotOverlapping() {
        let s1 = "#1 @ 1,3: 4x4"
        let s2 = "#2 @ 3,1: 4x4"
        let s3 = "#3 @ 5,5: 2x2"
        let rectangle1 = sut.makeRectangle(from: s1)
        let rectangle2 = sut.makeRectangle(from: s2)
        let rectangle3 = sut.makeRectangle(from: s3)

        sut.plot(rectangle1)
        sut.plot(rectangle2)
        sut.plot(rectangle3)
        
        let result = sut.claimNotOverlapping()
        XCTAssertEqual(result, 3)
    }
}
