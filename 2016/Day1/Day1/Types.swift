
import Foundation


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
