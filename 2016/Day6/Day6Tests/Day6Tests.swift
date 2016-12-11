
import XCTest
@testable import Day6


class Day6Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMessage_ReadsEaster() {
        let message = "eedadn\ndrvtee\neandsr\nraavrd\natevrs\ntsrnev\nsdttsa\nrasrtv\nnssdts\nntnada\nsvetve\ntesnvt\nvntsnd\nvrdear\ndvrsen\nenarar"
        let sut = MessageInterpreter(repeatingMessageSignal: message)
        let result = sut.errorCorrectedMessage()
        XCTAssert(result == "easter")
    }
    
    func testMessageFromFile_ReadsEaster() {
        let messageFileReader = MessageFileReader()
        let message = messageFileReader.message(fromFile: "TestData")
        
        let sut = MessageInterpreter(repeatingMessageSignal: message)
        let result = sut.errorCorrectedMessage()
        XCTAssert(result == "easter")
    }
    
    func testMessage_WorksForDifferentLengths() {
        let messageFileReader = MessageFileReader()
        let message = messageFileReader.message(fromFile: "TestData2")
        
        let sut = MessageInterpreter(repeatingMessageSignal: message)
        let result = sut.errorCorrectedMessage()
        XCTAssert(result == "easterbunny")
    }
    
}
