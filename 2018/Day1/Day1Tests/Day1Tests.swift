
import XCTest
@testable import Day1


class Day1Tests: XCTestCase {

    func testFrequencyCombo1() {
        let combo = [1, -2, 3, 1]
        let fc = FrequencyCalibrator()
        XCTAssertEqual(fc.resultingFrequency(from: combo), 3)
    }

    func testFrequencyCombo2() {
        let combo1 = [1, 1, 1]
        let combo2 = [1, 1, -2]
        let combo3 = [-1, -2, -3]
        let fc = FrequencyCalibrator()
        XCTAssertEqual(fc.resultingFrequency(from: combo1), 3)
        XCTAssertEqual(fc.resultingFrequency(from: combo2), 0)
        XCTAssertEqual(fc.resultingFrequency(from: combo3), -6)
    }

    func testDuplicatedFrequency1() {
        let combo = [1, -1]
        let fc = FrequencyCalibrator()
        XCTAssertEqual(fc.firstFrequencyReachedTwice(from: combo), 0)
    }

    func testDuplicatedFrequency2() {
        let combo1 = [3, 3, 4, -2, -4]
        let combo2 = [-6, 3, 8, 5, -6]
        let combo3 = [7, 7, -2, -7, -4]

        let fc = FrequencyCalibrator()
        XCTAssertEqual(fc.firstFrequencyReachedTwice(from: combo1), 10)
        XCTAssertEqual(fc.firstFrequencyReachedTwice(from: combo2), 5)
        XCTAssertEqual(fc.firstFrequencyReachedTwice(from: combo3), 14)
    }

}
