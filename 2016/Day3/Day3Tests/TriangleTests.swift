
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


class TriangleKeeperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPossbileTriangles() {
        let triangle1 = Triangle(a: 5, b: 10, c: 14)
        let triangle2 = Triangle(a: 5, b: 10, c: 14)
        let sut = TriangleKeeper(triangles: [triangle1, triangle2])
        XCTAssert(sut.totalPossibleTriangles() == 2)
    }
    
    func testImpossbileTriangles() {
        let triangle1 = Triangle(a: 5, b: 10, c: 14)
        let triangle2 = Triangle(a: 5, b: 10, c: 25)
        let sut = TriangleKeeper(triangles: [triangle1, triangle2])
        XCTAssert(sut.totalPossibleTriangles() == 1)
    }
    
}

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
        dump(result)
        XCTAssert(result.count == 2)
    }
    
    func testTriangles_BadDataCount() {
        let sut = TriangleFileReader()
        let result = sut.triangles(from: "  785  361\n  622  375  125")
        dump(result)
        XCTAssert(result.count == 1)
    }
    
    func testTriangles_BadDataString() {
        let sut = TriangleFileReader()
        let result = sut.triangles(from: "  775  785  361\n  622  aoeu  125")
        dump(result)
        XCTAssert(result.count == 1)
    }
    
    func testTriangles_FromSmallFile() {
        let sut = TriangleFileReader()
        let result = sut.triangles(fromFile: "TrianglesDataSmall")
        dump(result)
        XCTAssert(result.count == 2)
    }
    
}
