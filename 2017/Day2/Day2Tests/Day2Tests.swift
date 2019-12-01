
import XCTest
@testable import Day2

class Day2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let sut = IntMatrixMaker()
        let expected = [
            [5, 1, 9, 5],
            [7, 5, 3, 0],
            [2, 4, 6, 8],
        ]
        let result = sut.giveMeMatrix(fromFile: "InputTest")
        XCTAssert(result == expected)
    }
    
    func testFirstDiff_8() {
        let matrix = IntMatrixMaker().giveMeMatrix(fromFile: "InputTest")
        let sut = Spreadsheet(matrix: matrix)
        XCTAssert(sut.checksum(for: matrix[0]) == 8)
    }
    func testSecondDiff_4() {
        let matrix = IntMatrixMaker().giveMeMatrix(fromFile: "InputTest")
        let sut = Spreadsheet(matrix: matrix)
        XCTAssert(sut.checksum(for: matrix[1]) == 4)
    }
    func testThirdDiff_6() {
        let matrix = IntMatrixMaker().giveMeMatrix(fromFile: "InputTest")
        let sut = Spreadsheet(matrix: matrix)
        XCTAssert(sut.checksum(for: matrix[2]) == 6)
    }
    func testChecksum_Equals18() {
        let matrix = IntMatrixMaker().giveMeMatrix(fromFile: "InputTest")
        let sut = Spreadsheet(matrix: matrix)
        XCTAssert(sut.checksum() == 18)
    }
}

func ==<Element : Equatable> (lhs: [[Element]], rhs: [[Element]]) -> Bool {
    return lhs.elementsEqual(rhs, by: ==)
}
