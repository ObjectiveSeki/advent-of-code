
import Foundation


extension String {
    func regexIntMatches() -> [Int] {
        let range = NSRange(location: 0, length: self.utf16.count)
        let regex = try! NSRegularExpression(
            pattern: "(\\d+)",
            options: []
        )
        let matches = regex.matches(in: self, options: [], range: range)
        let numbers = matches.map {
            String(self[Range($0.range, in: self)!])
        }
        return numbers.map { Int($0)! }
    }
}
