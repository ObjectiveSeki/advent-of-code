
import Foundation


enum Weather: String {
    case West
    case North
    case East
    case South
}

enum Turn: String {
    case Right = "R"
    case Left = "L"
}



extension Coordinate: Equatable {}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    let areEqual = lhs.x == rhs.x && lhs.y == rhs.y
    return areEqual
}

struct Coordinate {
    let x: Int
    let y: Int
}
struct Block {
    let coordinate: Coordinate
    var visits = 1
    
    func distance() -> Int {
        return abs(coordinate.x) + abs(coordinate.y)
    }
}



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



struct Command {
    let turn: Turn
    let blocks: Int
    init(c: String) {
        let s = String(c.characters.first!)
        turn = Turn(rawValue: s)!
        let index = c.index(c.startIndex, offsetBy: 1)
        let b = c.substring(from: index)
        blocks = Int(b)!
    }
}

struct Day1 {
    
    var pivot: Int
    let direction = [Weather.West, Weather.North, Weather.East, Weather.South]
    var grid = Grid()
    
    init(pivot: Int = 1) {
        self.pivot = pivot
    }
    
    mutating func command(c: String) {
        
        let array = c.components(separatedBy: ", ")
        
        for c in array {
            let command = Command(c: c)
            switch command.turn {
            case .Right:
                pivot += 1
            case .Left:
                pivot -= 1
            }
            
            switch pivot {
            case -1:
                pivot = 3
            case 4:
                pivot = 0
            default:
                break
            }
            
            let d = direction[pivot]
            grid.move(in: d, value: command.blocks)
            
        }
        
    }
    
}
