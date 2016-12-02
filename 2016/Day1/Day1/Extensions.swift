
import Foundation


extension Coordinate: Equatable {}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    let areEqual = lhs.x == rhs.x && lhs.y == rhs.y
    return areEqual
}
