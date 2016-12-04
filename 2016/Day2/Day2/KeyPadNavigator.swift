
import Foundation


protocol KeyPadNavigator {
    var pad: [[Int]] { get }
    var currentPosition: Position { get set }
    mutating func navigate(with directions: Directions)
    mutating func update(direction: Direction)
    func currentPadPosition() -> Int
}

extension KeyPadNavigator {
    mutating func navigate(with directions: Directions) {
        for direction in directions.list {
            update(direction: direction)
        }
    }
    func currentPadPosition() -> Int {
        return pad[currentPosition.X()][currentPosition.Y()]
    }
}
