
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
    func isUpper() -> Bool {
        return self == self.uppercased()
    }
}


extension Array where Element == [Area] {
    func flipped() -> [[Area]] {
        var copy = self
        for i in 0..<self.count {
            for j in 0..<self.count {
                copy[j][i] = self[i][j]
            }
        }
        return copy
    }
}

extension Array where Element == [Int] {
    func highestValue() -> Int {
        guard self.count != 0 else { return 0 }
        var max = 0
        for array in self {
            if array.max()! > max {
                max = array.max()!
            }
        }
        return max
    }
}
