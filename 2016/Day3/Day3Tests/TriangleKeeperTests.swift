
import XCTest
@testable import Day3


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
