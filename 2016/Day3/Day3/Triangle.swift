
import Foundation


struct Triangle {
    let a: Int
    let b: Int
    let c: Int
    let isValid: Bool
    init(a: Int, b: Int, c: Int) {
        self.a = a
        self.b = b
        self.c = c
        if a + b > c && a + c > b && b + c > a {
            isValid = true
        }
        else {
            isValid = false
        }
    }
}
