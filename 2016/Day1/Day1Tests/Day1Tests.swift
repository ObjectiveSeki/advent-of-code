
import XCTest
@testable import Day1


class Day1Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRight2() {
        var day = Day1()
        day.command(c: "R2")
        let distance = day.grid.distance()
        XCTAssert(distance == 2)
    }
    
    func testRight2Left3() {
        var day = Day1()
        day.command(c: "R2, L3")
        let distance = day.grid.distance()
        XCTAssert(distance == 5)
    }
    
    func testRight2Right2Right2() {
        var day = Day1()
        day.command(c: "R2, R2, R2")
        let distance = day.grid.distance()
        XCTAssert(distance == 2)
    }
    
    func testRight5Left5Right5Right3() {
        var day = Day1()
        day.command(c: "R5, L5, R5, R3")
        let distance = day.grid.distance()
        XCTAssert(distance == 12)
    }
    
    func testRight42() {
        var day = Day1()
        day.command(c: "R42")
        let distance = day.grid.distance()
        XCTAssert(distance == 42)
    }
    
    func testRight8Right4Right4Right8_FirstVisit() {
        var day = Day1()
        day.command(c: "R8, R4, R4, R8")
        let distance = day.grid.firstBlockVisitedTwice?.distance()
        XCTAssert(distance == 4)
    }
    
}
