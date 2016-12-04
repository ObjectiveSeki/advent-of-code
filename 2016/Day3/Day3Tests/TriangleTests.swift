
import XCTest
@testable import Day3


class TriangleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTriangle_isValid() {
        let sut = Triangle(a: 5, b: 10, c: 14)
        XCTAssertTrue(sut.isValid)
    }
    
    func testTriangle_isInvalid() {
        let sut = Triangle(a: 5, b: 10, c: 25)
        XCTAssertFalse(sut.isValid)
    }
    
}

