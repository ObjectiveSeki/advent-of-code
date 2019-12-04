
import XCTest
@testable import AoC2019


class Day4: XCTestCase {


    // MARK: Part 1

    func test1() {
        let sut = OKPassword()
        XCTAssertTrue(sut.isPasswordOK(password: 111111))
    }

    func test2() {
        let sut = OKPassword()
        XCTAssertFalse(sut.isPasswordOK(password: 223450))
    }

    func test3() {
        let sut = OKPassword()
        XCTAssertFalse(sut.isPasswordOK(password: 123789))
    }


    // MARK: Part 2

    func test4() {
        let sut = OKPassword()
        XCTAssertTrue(sut.isPasswordOKExtraRule(password: 112233))
    }

    func test5() {
        let sut = OKPassword()
        XCTAssertFalse(sut.isPasswordOKExtraRule(password: 123444))
    }

    func test6() {
        let sut = OKPassword()
        XCTAssertTrue(sut.isPasswordOKExtraRule(password: 111122))
    }

}
