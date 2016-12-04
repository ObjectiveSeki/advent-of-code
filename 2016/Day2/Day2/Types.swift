
import Foundation

protocol Position {
    var x: Int { get }
    var y: Int { get }
    func X() -> Int
    func Y() -> Int
}

struct NormalPosition: Position {
    let x: Int
    let y: Int
    init?(x: Int, y: Int) {
        self.x = x
        self.y = y
        if self.x < 0 || self.x > 2 { return nil }
        if self.y < 0 || self.y > 2 { return nil }
    }
    func X() -> Int { return y }
    func Y() -> Int { return x }
}

struct RealPosition: Position {
    let x: Int
    let y: Int
    init?(x: Int, y: Int) {
        self.x = x
        self.y = y
        if self.x < 0 || self.x > 4 { return nil }
        if self.y < 0 || self.y > 4 { return nil }
    }
    func X() -> Int { return y }
    func Y() -> Int { return x }
}

struct Directions {
    let list: [Direction]
    init(directionData: String) {
        let array = directionData.characters.map { String($0) }
        var tmpList: [Direction] = []
        for value in array {
            if let direction = Direction(rawValue: value) {
                tmpList.append(direction)
            }
        }
        list = tmpList
    }
}

struct DirectionsSet {
    let list: [Directions]
    init(directionData: String) {
        let components = directionData.components(separatedBy: "\n")
        var tmpList: [Directions] = []
        for c in components {
            tmpList.append(Directions(directionData: c))
        }
        list = tmpList
    }
}
