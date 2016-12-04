
import Foundation


struct KeyPad: KeyPadNavigator {
    
    let pad = [
        [1,2,3],
        [4,5,6],
        [7,8,9]
    ]
    var code = ""
    internal var currentPosition: Position = NormalPosition(x: 1, y: 1)!
    
    mutating func navigate(with directionsSet: DirectionsSet) {
        for directions in directionsSet.list {
            navigate(with: directions)
            code += String(currentPadPosition())
        }
    }
    
    mutating func update(direction: Direction) {
        switch direction {
        case .Up:
            guard let p = NormalPosition(x: currentPosition.x, y: currentPosition.y-1) else { break }
            currentPosition = p
        case .Left:
            guard let p = NormalPosition(x: currentPosition.x-1, y: currentPosition.y) else { break }
            currentPosition = p
        case .Right:
            guard let p = NormalPosition(x: currentPosition.x+1, y: currentPosition.y) else { break }
            currentPosition = p
        case .Down:
            guard let p = NormalPosition(x: currentPosition.x, y: currentPosition.y+1) else { break }
            currentPosition = p
        }
    }
    
}
