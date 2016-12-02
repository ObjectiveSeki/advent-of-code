
import Foundation


struct Grid {
    var x = 0
    var y = 0
    
    var visitedBlocks: [Block] = []
    var firstBlockVisitedTwice: Block? = nil
    
    mutating func move(in direction: Weather, value: Int) {
        for _ in 1...value {
            switch direction {
            case .West:
                x -= 1
            case .North:
                y += 1
            case .East:
                x += 1
            case .South:
                y -= 1
            }
            let coor = Coordinate(x: x, y: y)
            let newBlock = Block(coordinate: coor, visits: 1)
            
            if firstBlockVisitedTwice == nil {
                for b in visitedBlocks {
                    if b.coordinate == newBlock.coordinate {
                        firstBlockVisitedTwice = b
                        break
                    }
                }
            }
            
            visitedBlocks.append(newBlock)
            
        }
    }
    
    func distance() -> Int {
        return abs(x) + abs(y)
    }
    
}
