
import XCTest
@testable import Day1


class Day1Tests: XCTestCase {
    
    var sut: DestinationCalculator!
    
    override func setUp() {
        super.setUp()
        sut = DestinationCalculator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRight2() {
        sut.command(c: "R2")
        let distance = sut.grid.distance()
        XCTAssert(distance == 2)
    }
    
    func testRight2Left3() {
        sut.command(c: "R2, L3")
        let distance = sut.grid.distance()
        XCTAssert(distance == 5)
    }
    
    func testRight2Right2Right2() {
        sut.command(c: "R2, R2, R2")
        let distance = sut.grid.distance()
        XCTAssert(distance == 2)
    }
    
    func testRight5Left5Right5Right3() {
        sut.command(c: "R5, L5, R5, R3")
        let distance = sut.grid.distance()
        XCTAssert(distance == 12)
    }
    
    func testRight42() {
        sut.command(c: "R42")
        let distance = sut.grid.distance()
        XCTAssert(distance == 42)
    }
    
    func testRight8Right4Right4Right8_FirstVisit() {
        sut.command(c: "R8, R4, R4, R8")
        let distance = sut.grid.firstBlockVisitedTwice?.distance()
        XCTAssert(distance == 4)
    }
    
}
