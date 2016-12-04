
import Foundation


extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}

struct RealKeyPad {
    
    let pad = [
        [0,  0,  1,  0,  0],
        [0,  2,  3,  4,  0],
        [5,  6,  7,  8,  9],
        [0,  65, 66, 67, 0],
        [0,  0,  68, 0,  0]
    ]
    var code = ""
    private var currentPosition = RealPosition(x: 0, y: 2)!
    
    mutating func navigate(with directionsSet: DirectionsSet) {
        for directions in directionsSet.list {
            navigate(with: directions)
            if currentPadPosition() >= 65 {
                let unicode = UnicodeScalar(currentPadPosition())!
                code += unicode.description
            }
            else {
                code += String(currentPadPosition())
            }
        }
    }
    
    mutating func navigate(with directions: Directions) {
        for direction in directions.list {
            update(direction: direction)
        }
    }
    
    mutating func update(direction: Direction) {
        switch direction {
        case .Up:
            guard let p = RealPosition(x: currentPosition.x, y: currentPosition.y-1) else { break }
            if pad[p.X()][p.Y()] == 0 {
                break
            }
            currentPosition = p
        case .Left:
            guard let p = RealPosition(x: currentPosition.x-1, y: currentPosition.y) else { break }
            if pad[p.X()][p.Y()] == 0 {
                break
            }
            currentPosition = p
        case .Right:
            guard let p = RealPosition(x: currentPosition.x+1, y: currentPosition.y) else { break }
            if pad[p.X()][p.Y()] == 0 {
                break
            }
            currentPosition = p
        case .Down:
            guard let p = RealPosition(x: currentPosition.x, y: currentPosition.y+1) else { break }
            if pad[p.X()][p.Y()] == 0 {
                break
            }
            currentPosition = p
        }
    }
    
    func currentPadPosition() -> Int {
        return pad[currentPosition.X()][currentPosition.Y()]
    }
    
}

struct KeyPad {
    
    let pad = [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ]
    var code = ""
    private var currentPosition = Position(x: 1, y: 1)!
    
    mutating func navigate(with directionsSet: DirectionsSet) {
        for directions in directionsSet.list {
            navigate(with: directions)
            code += String(currentPadPosition())
        }
    }
    
    mutating func navigate(with directions: Directions) {
        for direction in directions.list {
            update(direction: direction)
        }
    }
    
    mutating func update(direction: Direction) {
        switch direction {
        case .Up:
            guard let p = Position(x: currentPosition.x, y: currentPosition.y-1) else { break }
            currentPosition = p
        case .Left:
            guard let p = Position(x: currentPosition.x-1, y: currentPosition.y) else { break }
            currentPosition = p
        case .Right:
            guard let p = Position(x: currentPosition.x+1, y: currentPosition.y) else { break }
            currentPosition = p
        case .Down:
            guard let p = Position(x: currentPosition.x, y: currentPosition.y+1) else { break }
            currentPosition = p
        }
    }
    
    func currentPadPosition() -> Int {
        return pad[currentPosition.X()][currentPosition.Y()]
    }
    
}
