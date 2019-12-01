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

    func testAlmostIdentical1() {
        let result = sut.almostIdentical("fghij", "fguij")
        XCTAssertEqual(result, "fgij")
    }
    func testAlmostIdentical2() {
        let result = sut.almostIdentical("abcde", "axcye")
        XCTAssertNil(result)
    }

    func testAlmostIdentical3() {
        let array = [
            "abcde",
            "fghij",
            "klmno",
            "pqrst",
            "fguij",
            "axcye",
            "wvxyzMM",
            ]
        let result = sut.almostIdentical(from: array)
        XCTAssertEqual(result, "fgij")
    }
    
}
