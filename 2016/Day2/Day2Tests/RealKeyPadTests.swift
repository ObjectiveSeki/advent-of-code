
import XCTest
@testable import Day2


class RealKeyPadTests: XCTestCase {
    
    var sut: RealKeyPad!
    
    override func setUp() {
        super.setUp()
        sut = RealKeyPad()
    }
    
    override func tearDown() {
        super.tearDown()
    }

        
    func testX0Y2_Equals5() {
        let position = Position(x: 0, y: 2)!
        XCTAssert(sut.pad[position.X()][position.Y()] == 5)
    }
        
    func testU_Equals2() {
        let data = "U"
        sut.update(direction: Direction(rawValue: data)!)
        XCTAssert(sut.currentPadPosition() == 5)
    }

    func testULL_Equals68() {
        let directions = Directions(directionData: "ULL")
        sut.navigate(with: directions)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 5)
    }

    func testULLThenRRDDD_Equals9() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD")
        sut.navigate(with: directionsSet)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 68)
    }

    func testULLThenRRDDDThenLURDL_Equals8() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD\nLURDL")
        sut.navigate(with: directionsSet)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 66)
    }

    func testULLThenRRDDDThenLURDLThenUUUUD_Equals5() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD\nLURDL\nUUUUD")
        sut.navigate(with: directionsSet)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 3)
    }

    func testULLThenRRDDDThenLURDLThenUUUUD_CodeEquals1985() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD\nLURDL\nUUUUD")
        sut.navigate(with: directionsSet)
        dump(sut.code)
        XCTAssert(sut.code == "5DB3")
    }
    
}
