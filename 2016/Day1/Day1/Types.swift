
import Foundation


struct Coordinate {
    var x: Int
    var y: Int
}

struct Block {
    let coordinate: Coordinate
    func distance() -> Int {
        return abs(coordinate.x) + abs(coordinate.y)
    }
}

struct Move {
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

struct Moves {
    let list: [Move]
    init(moveData: String) {
        let moveComponents = moveData.components(separatedBy: ", ")
        var tmpList: [Move] = []
        for c in moveComponents {
            tmpList.append(Move(c: c))
        }
        list = tmpList
    }
}
