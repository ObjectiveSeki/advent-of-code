
import XCTest
@testable import Day1


class Day1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: Sum Next
    
    func testSumNext_1122() {
        let sut = Captcha(sequence: [1, 1, 2, 2])
        XCTAssert(sut.sumNext() == 3)
    }
    
    func testSumNext_1111() {
        let sut = Captcha(sequence: [1, 1, 1, 1])
        XCTAssert(sut.sumNext() == 4)
    }
    
    func testSumNext_1234() {
        let sut = Captcha(sequence: [1, 2, 3, 4])
        XCTAssert(sut.sumNext() == 0)
    }
    
    func testSumNext_91212129() {
        let sut = Captcha(sequence: [9, 1, 2, 1, 2, 1, 2, 9])
        XCTAssert(sut.sumNext() == 9)
    }
    
    
    // MARK: Sum HalfwayAround
    
    func testSumHalyway_1212() {
        let sut = Captcha(sequence: [1, 2, 1, 2])
        XCTAssert(sut.sumHalfwayAround() == 6)
    }
    
    func testSumHalyway_1221() {
        let sut = Captcha(sequence: [1, 2, 2, 1])
        XCTAssert(sut.sumHalfwayAround() == 0)
    }
    
    func testSumHalyway_123425() {
        let array = IntArrayMaker().giveMeArray(fromString: "123425")
        let sut = Captcha(sequence: array)
        XCTAssert(sut.sumHalfwayAround() == 4)
    }
    
    func testSumHalyway_123123() {
        let array = IntArrayMaker().giveMeArray(fromString: "123123")
        let sut = Captcha(sequence: array)
        XCTAssert(sut.sumHalfwayAround() == 12)
    }
    
    func testSumHalyway_12131415() {
        let array = IntArrayMaker().giveMeArray(fromString: "12131415")
        let sut = Captcha(sequence: array)
        XCTAssert(sut.sumHalfwayAround() == 4)
    }
    
    
    // MARK: File Reader
    
    func testFileReader() {
        struct FR: FileReader {}
        let sut = FR()
        let result = sut.string(fromFile: "InputTest")
        XCTAssert(result == "91212129")
    }
    
    func testArrayMaker() {
        let maker = IntArrayMaker()
        let array = maker.giveMeArray(fromFile: "InputTest")
        XCTAssert(array == [9, 1, 2, 1, 2, 1, 2, 9])
    }
}
