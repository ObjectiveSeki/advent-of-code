
import Foundation


struct AlchemicalReduction: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let s = string(fromFile: input)!
        return String(resultingPolymer(from: s).count)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let s = string(fromFile: input)!
        return String(shortestPolymerCount(from: s))
    }


    func resultingPolymer(from string: String) -> String {
        guard string.count >= 2 else { return string }
        var sss = string
        var i = 0
        while i < sss.count - 1 {
            let firstIndex = sss.index(sss.startIndex, offsetBy: i)
            let secondIndex = sss.index(sss.startIndex, offsetBy: i + 1)
            let s1 = sss[firstIndex].description
            let s2 = sss[secondIndex].description
            if s1.isUpper() != s2.isUpper() && s1.uppercased() == s2.uppercased() {
                sss = sss.replacingCharacters(in: firstIndex...secondIndex, with: "")
                if i > 0 {
                    i -= 1
                }
            } else {
                i += 1
            }
        }
        return sss
    }

    func shortestPolymerCount(from string: String) -> Int {
        var counts = [Int]()
        let rAa = removeInstances(of: ["A", "a"], from: string)
        let rBb = removeInstances(of: ["B", "b"], from: string)
        let rCc = removeInstances(of: ["C", "c"], from: string)
        let rDd = removeInstances(of: ["D", "d"], from: string)
        counts.append(resultingPolymer(from: rAa).count)
        counts.append(resultingPolymer(from: rBb).count)
        counts.append(resultingPolymer(from: rCc).count)
        counts.append(resultingPolymer(from: rDd).count)
        return counts.min()!
    }

    func removeInstances(of array: [String], from string: String) -> String {
        var s = string
        for element in array {
            s = s.replacingOccurrences(of: element, with: "")
        }
        return s
    }

}
