
import XCTest
@testable import Day2


class KeyPadTests: XCTestCase {
    
    var sut: KeyPad!
    
    override func setUp() {
        sut = KeyPad()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testX0Y2_Equals7() {
        let position = Position(x: 0, y: 2)!
        XCTAssert(sut.pad[position.X()][position.Y()] == 7)
    }
    
    func testU_Equals2() {
        let data = "U"
        sut.update(direction: Direction(rawValue: data)!)
        XCTAssert(sut.currentPadPosition() == 2)
    }
    
    func testULL_Equals1() {
        let directions = Directions(directionData: "ULL")
        sut.navigate(with: directions)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 1)
    }
    
    func testULLThenRRDDD_Equals9() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD")
        sut.navigate(with: directionsSet)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 9)
    }
    
    func testULLThenRRDDDThenLURDL_Equals8() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD\nLURDL")
        sut.navigate(with: directionsSet)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 8)
    }
    
    func testULLThenRRDDDThenLURDLThenUUUUD_Equals5() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD\nLURDL\nUUUUD")
        sut.navigate(with: directionsSet)
        dump(sut.currentPadPosition())
        XCTAssert(sut.currentPadPosition() == 5)
    }
    
    func testULLThenRRDDDThenLURDLThenUUUUD_CodeEquals1985() {
        let directionsSet = DirectionsSet(directionData: "ULL\nRRDDD\nLURDL\nUUUUD")
        sut.navigate(with: directionsSet)
        dump(sut.code)
        XCTAssert(sut.code == "1985")
    }
    
}
