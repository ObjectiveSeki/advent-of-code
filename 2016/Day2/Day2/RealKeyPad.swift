
import Foundation


struct RealKeyPad: KeyPadNavigator {
    
    let pad = [
        [0,  0,  1,  0,  0],
        [0,  2,  3,  4,  0],
        [5,  6,  7,  8,  9],
        [0,  65, 66, 67, 0],
        [0,  0,  68, 0,  0]
    ]
    var code = ""
    internal var currentPosition: Position = RealPosition(x: 0, y: 2)!
    
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
    
    mutating func update(direction: Direction) {
        switch direction {
        case .Up:
            guard let p = RealPosition(x: currentPosition.x, y: currentPosition.y-1) else { break }
            if pad[p.X()][p.Y()] == 0 { break }
            currentPosition = p
        case .Left:
            guard let p = RealPosition(x: currentPosition.x-1, y: currentPosition.y) else { break }
            if pad[p.X()][p.Y()] == 0 { break }
            currentPosition = p
        case .Right:
            guard let p = RealPosition(x: currentPosition.x+1, y: currentPosition.y) else { break }
            if pad[p.X()][p.Y()] == 0 { break }
            currentPosition = p
        case .Down:
            guard let p = RealPosition(x: currentPosition.x, y: currentPosition.y+1) else { break }
            if pad[p.X()][p.Y()] == 0 { break }
            currentPosition = p
        }
    }
    
}
