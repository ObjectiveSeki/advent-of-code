
import XCTest
@testable import AoC2019


class Day8Tests: XCTestCase {


    // MARK: Part 1

    func test1() {
        let data = "123456"
        let sut = SpaceImageFormat(data: data, wide: 3, tall: 2)

        let expected = [[
            [1,2,3],
            [4,5,6]
        ]]
        XCTAssertEqual(sut.createImage(), expected)
    }

    func test2() {
        let data = "123456789012"
        let sut = SpaceImageFormat(data: data, wide: 3, tall: 2)

        let expected = [
            [
                [1,2,3],
                [4,5,6]
            ],
            [
                [7,8,9],
                [0,1,2]
            ]
        ]
        XCTAssertEqual(sut.createImage(), expected)
    }

    func test3() {
        let data = "123456789012"
        let sut = SpaceImageFormat(data: data, wide: 3, tall: 2)
        let expected = [
            [1,2,3],
            [4,5,6]
        ]
        XCTAssertEqual(sut.layerFewestZero(), expected)
    }

    func test4() {
        let data = "113422789012"
        let sut = SpaceImageFormat(data: data, wide: 3, tall: 2)
        let fewestZeros = sut.layerFewestZero()
        XCTAssertEqual(sut.multiTest(for: fewestZeros, x: 1, y: 2), 4)
    }


    // MARK: Part 2

    func test5() {
        let data = "0222112222120000"
        let sut = SpaceImageFormat(data: data, wide: 2, tall: 2)
        let expected = [
            [0,1],
            [1,0]
        ]
        XCTAssertEqual(sut.finalImage(), expected)

    }

}
