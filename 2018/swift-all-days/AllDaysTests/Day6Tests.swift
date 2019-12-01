
import XCTest
@testable import AllDays


class Day6Tests: XCTestCase {

    var sut: ChronalCoordinates!

    override func setUp() {
        sut = ChronalCoordinates()
    }

    func testX() {
        setupTestGrid()
        let expected = [
            [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", "1", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "3", "."],
            [".", ".", ".", "4", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", "5", ".", ".", ".", "."],
            [".", "2", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
            [".", ".", ".", ".", ".", ".", ".", ".", "6", "."],
        ]
        let r2 = sut.grid.flipped().map {
            $0.map { area in
                return area.description2
            }
        }
        XCTAssertEqual(r2, expected)
    }

    func testAreaBeloningToCoords() {
        setupTestGrid()
        sut.decideAreaBelongingToCoords()
        for aoeu in sut.grid.flipped() { print(aoeu) }

        let r1 = sut.grid[2][2].belongToID
        XCTAssertEqual(r1, 1)

        let r2 = sut.grid[3][2].belongToID
        XCTAssertEqual(r2, 4)

        let r3 = sut.grid[0][4].belongToID
        XCTAssertEqual(r3, 0)
    }

    func testLargestArea() {
        setupTestGrid()
        sut.decideAreaBelongingToCoords()
        for aoeu in sut.grid.flipped() { print(aoeu) }

        let result = sut.largestArea()
        XCTAssertEqual(result, 17)
    }

    func testMiddleRegionSize() {
        setupTestGrid()
        sut.decideMiddleRegion(within: 32)
        let description = sut.grid.flipped().map {
            $0.map { area in
                return area.description3
            }
        }
        for aoeu in description { print(aoeu) }

        let result = sut.middleRegionSize
        XCTAssertEqual(result, 16)
    }


    // MARK: Helper methods

    func setupTestGrid() {
        let coordinates = [
            [1, 1],
            [1, 6],
            [8, 3],
            [3, 4],
            [5, 5],
            [8, 9],
        ]
        sut.createGridWith(coordinates: coordinates)
        for aoeu in sut.grid.flipped() { print(aoeu) }
    }

}
