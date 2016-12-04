
import XCTest
@testable import Day3


class TriangleFileReaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTriangle_isValid() {
        let sut = TriangleFileReader()
        let triangle = Triangle(a: 775, b: 785, c: 361)
        let result = sut.triangle(from: "  775  785  361")
        XCTAssert(triangle == result)
    }
    
    func testTriangles_Count() {
        let sut = TriangleFileReader()
        let result = sut.triangles(from: "  775  785  361\n  622  375  125")
        XCTAssert(result.count == 2)
    }
    
    func testTriangles_BadDataCount() {
        let sut = TriangleFileReader()
        let result = sut.triangles(from: "  785  361\n  622  375  125")
        XCTAssert(result.count == 1)
    }
    
    func testTriangles_BadDataString() {
        let sut = TriangleFileReader()
        let result = sut.triangles(from: "  775  785  361\n  622  aoeu  125")
        XCTAssert(result.count == 1)
    }
    
    func testTriangles_FromSmallFile() {
        let sut = TriangleFileReader()
        let result = sut.triangles(fromFile: "TrianglesDataSmall")
        XCTAssert(result.count == 2)
    }
    
    func testRealTriangles_Vertically() {
        let sut = TriangleFileReader()
        let expected = [
            Triangle(a: 10, b: 13, c: 16),
            Triangle(a: 11, b: 14, c: 17),
            Triangle(a: 12, b: 15, c: 18)
        ]
        let result = sut.realTriangles(fromFile: "TriangleDataSmallReal")
        
        XCTAssert(result[0] == expected[0])
        XCTAssert(result[1] == expected[1])
        XCTAssert(result[2] == expected[2])
    }
    
}
