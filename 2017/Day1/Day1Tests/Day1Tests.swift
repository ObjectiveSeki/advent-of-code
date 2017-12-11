
import XCTest
@testable import Day1


class Day1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSum_1122() {
        let sut = Captcha(sequence: [1, 1, 2, 2])
        XCTAssert(sut.sum() == 3)
    }
    
    func testSum_1111() {
        let sut = Captcha(sequence: [1, 1, 1, 1])
        XCTAssert(sut.sum() == 4)
    }
    
    func testSum_1234() {
        let sut = Captcha(sequence: [1, 2, 3, 4])
        XCTAssert(sut.sum() == 0)
    }
    
    func testSum_91212129() {
        let sut = Captcha(sequence: [9, 1, 2, 1, 2, 1, 2, 9])
        XCTAssert(sut.sum() == 9)
    }
    
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
