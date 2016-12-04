
import Foundation


extension Triangle: Equatable {}

func ==(lhs: Triangle, rhs: Triangle) -> Bool {
    let areEqual = lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c
    return areEqual
}
