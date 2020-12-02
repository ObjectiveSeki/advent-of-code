
import XCTest
@testable import AoC2020


class Day2Tests: XCTestCase {

    let input = [
        "1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc",
    ]
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOne() throws {
        let result = PasswordPhilosophy().validOnes(passwords: input)
        XCTAssertEqual(result.count, 2)
    }

    func testTwo() throws {
        let result = PasswordPhilosophy().validOnes2(passwords: input)
        XCTAssertEqual(result.count, 1)
    }

}
