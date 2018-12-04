import XCTest
@testable import AllDays


class Day2Tests: XCTestCase {

    var sut: IDScanner!

    override func setUp() {
        sut = IDScanner()
    }

    func testLetterAppears1() {
        XCTAssertFalse(sut.letters(appears: 2, in: "abcdef"))
        XCTAssertFalse(sut.letters(appears: 3, in: "abcdef"))
    }

    func testLetterAppears2() {
        XCTAssertTrue(sut.letters(appears: 2, in: "bababc"))
        XCTAssertTrue(sut.letters(appears: 3, in: "bababc"))
    }

    func testLetterAppearsThreeTimes() {
        XCTAssertTrue(sut.letters(appears: 2, in: "abbcde"))
        XCTAssertFalse(sut.letters(appears: 3, in: "abbcde"))
    }

    func testChecksum() {
        let array = [
            "abcdef",
            "bababc",
            "abbcde",
            "abcccd",
            "aabcdd",
            "abcdee",
            "ababab",
            ]
        let result = sut.checksum(from: array)
        XCTAssertEqual(result, 12)
    }
}
