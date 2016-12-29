
import XCTest
@testable import Day9


class Day9Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test1() {
        let sut = Decompresser(sequence: "Advent")
        let length = sut.decompressedLength()
        XCTAssert(length == 6)
    }
    
    func test2() {
        let sut = Decompresser(sequence: "A(1x5)BC")
        let decompressed = sut.decompressedSequenceV2()
        dump(decompressed)
        XCTAssert(decompressed == "ABBBBBC")
        let length = sut.decompressedLength()
        dump(length)
        XCTAssert(length == 7)
    }
    
    func test3() {
        let sut = Decompresser(sequence: "(3x3)XYZ")
        let decompressed = sut.decompressedSequence()
        dump(decompressed)
        XCTAssert(decompressed == "XYZXYZXYZ")
        let length = sut.decompressedLength()
        dump(length)
        XCTAssert(length == 9)
    }
    
    func test4() {
        let sut = Decompresser(sequence: "A(2x2)BCD(2x2)EFG")
        let decompressed = sut.decompressedSequence()
        dump(decompressed)
        XCTAssert(decompressed == "ABCBCDEFEFG")
        let length = sut.decompressedLength()
        dump(length)
        XCTAssert(length == 11)
    }
    
    func test5() {
        let sut = Decompresser(sequence: "(6x1)(1x3)A")
        let decompressed = sut.decompressedSequence()
        dump(decompressed)
        XCTAssert(decompressed == "(1x3)A")
        let length = sut.decompressedLength()
        dump(length)
        XCTAssert(length == 6)
    }
    
    func test6() {
        let sut = Decompresser(sequence: "X(8x2)(3x3)ABCY")
        let decompressed = sut.decompressedSequence()
        dump(decompressed)
        XCTAssert(decompressed == "X(3x3)ABC(3x3)ABCY")
        let length = sut.decompressedLength()
        dump(length)
        XCTAssert(length == 18)
    }
    
    func test7() {
        let sut = Decompresser(sequence: "(10x10)1234567890X")
        let decompressed = sut.decompressedSequence()
        dump(decompressed)
        XCTAssert(decompressed == "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890X")
    }
    
    func test8() {
        let sut = Decompresser(sequence: "X(8x2)(3x3)ABCY")
        let decompressed = sut.decompressedSequenceV2()
        dump(decompressed)
        XCTAssert(decompressed == "XABCABCABCABCABCABCY")
    }
    
//    func test9() {
//        let sut = Decompresser(sequence: "(27x12)(20x12)(13x14)(7x10)(1x12)A")
//        let length = sut.decompressedV2Length()
//        dump(length)
//        XCTAssert(length == 241920)
//    }
    
    func test10() {
        let sut = Decompresser(sequence: "(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN")
        let length = sut.decompressedV2Length()
        dump(length)
        XCTAssert(length == 445)
    }
    
    func test11() {
        let sut = Decompresser(sequence: "(27x12)(20x12)(13x14)(7x10)(1x12)A")
        let length = sut.decompressedLength(of: sut.sequence, usingDecompressedMarkers: true)
        dump(length)
        XCTAssert(length == 241920)
    }
    
}
