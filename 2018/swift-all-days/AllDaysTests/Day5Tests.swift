//
//  Day5Tests.swift
//  AllDaysTests
//
//  Created by Niclas Eriksson on 2018-12-15.
//  Copyright © 2018 DarkFit. All rights reserved.
//

import XCTest
@testable import AllDays


class Day5Tests: XCTestCase {

    func testReduction1() {
        let sut = AlchemicalReduction()
        XCTAssertEqual(sut.resultingPolymer(from: "aA"), "")
    }

    func testReduction2() {
        let sut = AlchemicalReduction()
        XCTAssertEqual(sut.resultingPolymer(from: "abBA"), "")
    }

    func testReduction3() {
        let sut = AlchemicalReduction()
        XCTAssertEqual(sut.resultingPolymer(from: "abAB"), "abAB")
    }

    func testReduction4() {
        let sut = AlchemicalReduction()
        XCTAssertEqual(sut.resultingPolymer(from: "aabAAB"), "aabAAB")
    }

    func testReduction5() {
        let sut = AlchemicalReduction()
        XCTAssertEqual(sut.resultingPolymer(from: "dabAcCaCBAcCcaDA"), "dabCBAcaDA")
    }

    func testRemovePlusReduction1() {
        let sut = AlchemicalReduction()
        let hej = sut.removeInstances(
            of: ["a", "A"],
            from: "dabAcCaCBAcCcaDA"
        )
        XCTAssertEqual(sut.resultingPolymer(from: hej), "dbCBcD")
    }

    func testShortestPolymer() {
        let sut = AlchemicalReduction()
        XCTAssertEqual(sut.shortestPolymerCount(from: "dabAcCaCBAcCcaDA"), 4)
    }

}
