
import XCTest
@testable import Day8


class Day8Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let sut = InstructionsFileReader()
//        let string = sut.string(fromFile: "TestData")
        let commands = sut.commands(from: "TestData")!
        XCTAssert(commands.count == 4)
    }
    
}
