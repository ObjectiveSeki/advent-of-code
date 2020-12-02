
import XCTest
@testable import AoC2020



class Day1Tests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testOne() {
        let array = [
            1721,
            979,
            366,
            299,
            675,
            1456,
        ]
        let result = ReportRepair().expenceDouble(array: array)
        XCTAssertEqual(result, 514579)
    }

    func testTwoo() {
        let array = [
            1721,
            979,
            366,
            299,
            675,
            1456,
        ]
        let result = ReportRepair().expenceTripple(array: array)
        XCTAssertEqual(result, 241861950)
    }

}
