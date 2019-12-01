
import XCTest
@testable import AoC2019


class Day1Tests: XCTestCase {


    // MARK: Part 1

    func test1() {
        let sut = FuelModule(mass: 12)
        XCTAssertEqual(sut.fuelNeeded, 2)
    }

    func test2() {
        let sut = FuelModule(mass: 14)
        XCTAssertEqual(sut.fuelNeeded, 2)
    }

    func test3() {
        let sut = FuelModule(mass: 1969)
        XCTAssertEqual(sut.fuelNeeded, 654)
    }

    func test4() {
        let sut = FuelModule(mass: 100756)
        XCTAssertEqual(sut.fuelNeeded, 33583)
    }

    func test5() {
        let modules = [
            FuelModule(mass: 100756),
            FuelModule(mass: 1969),
            FuelModule(mass: 14),
            FuelModule(mass: 12)
        ]
        let sut = FuelCounter()
        let result = sut.countFuelNeeded(for: modules)
        XCTAssertEqual(result, 33583 + 654 + 2 + 2)
    }


    // MARK: Part 2

    func test6() {
        let sut = FuelModule(mass: 1969)
        XCTAssertEqual(sut.fuelReallyNeeded(), 966)
    }

    func test7() {
        let sut = FuelModule(mass: 100756)
        XCTAssertEqual(sut.fuelReallyNeeded(), 50346)
    }
}
