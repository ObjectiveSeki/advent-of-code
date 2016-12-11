
import Foundation


extension String {
    func string(at index: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: index)
        let end = self.index(self.startIndex, offsetBy: index + 1)
        let range: Range = start..<end
        return self.substring(with: range)
    }
}
