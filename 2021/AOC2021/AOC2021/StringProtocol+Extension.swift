import Foundation

extension StringProtocol {
    subscript(offset: Int) -> String {
        self[index(startIndex, offsetBy: offset)].description
    }
}
