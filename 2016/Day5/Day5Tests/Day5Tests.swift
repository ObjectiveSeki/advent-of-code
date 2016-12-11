
import XCTest
@testable import Day5


class Day5Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFirstInterestingHash_AtCorrectIndex() {
        let cracker = PasswordCracker(input: "abc")
        let result = cracker.interestingHash(0)
        XCTAssert(result.0 == 3231929)
    }
    
    func testPasswordIsCorrect() {
        let cracker = PasswordCracker(input: "abc")
        let result = cracker.execute()
        dump(result)
        XCTAssert(result == "18f47a30")
    }
    
    func testRealPasswordIsCorrect() {
        let cracker = PasswordCracker(input: "abc")
        let result = cracker.executeReal()
        
        dump(result)
        XCTAssert(result == "05ace8e3")
    }
}
