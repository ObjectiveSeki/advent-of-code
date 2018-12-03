
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

}
