
import Foundation


struct Grid {
    
    var coordinate = Coordinate(x: 0, y: 0)
    private var visitedBlocks: [Block] = []
    private var firstBlockVisitedTwice: Block? = nil
    
    mutating func move(in direction: Weather, blocks: Int) {
        for _ in 1...blocks {
            incrementCoordinate(in: direction)
            updateVisitedBlocks()
        }
    }
    
    func distance() -> Int {
        let block = Block(coordinate: coordinate)
        return block.distance()
    }
    
    func realDistance() -> Int? {
        return firstBlockVisitedTwice?.distance()
    }
    
    
    private mutating func incrementCoordinate(in direction: Weather) {
        switch direction {
        case .West:
            coordinate.x -= 1
        case .North:
            coordinate.y += 1
        case .East:
            coordinate.x += 1
        case .South:
            coordinate.y -= 1
        }
    }
    
    private mutating func updateVisitedBlocks() {
        let newBlock = Block(coordinate: coordinate)
        if firstBlockVisitedTwice == nil {
            for block in visitedBlocks {
                if block.coordinate == newBlock.coordinate {
                    firstBlockVisitedTwice = block
                    break
                }
            }
        }
        visitedBlocks.append(newBlock)
    }
    
}
