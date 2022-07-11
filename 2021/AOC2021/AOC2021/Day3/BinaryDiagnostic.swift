
import Foundation

struct BinaryDiagnostic: FileReader {

    var input: [String]? = nil

    init(inputFile: String? = nil) {
        guard let file = inputFile else { return }
        input = stringArrayNewLine(fromFile: file)
    }

    func powerConsumption(_ diagnostic: [String]) -> Int {
        var dict = [Int:Int]()
        for s in diagnostic {
            for (key, value) in s.enumerated() {
                dict[key, default: 0] += Int(value.description)!
            }
        }
        var gamma = "", epsilon = ""
        for (_, value) in dict.sorted(by: {$0.key < $1.key}) {
            if value > diagnostic.count/2 {
                gamma += "1"
                epsilon += "0"
            } else {
                gamma += "0"
                epsilon += "1"
            }
        }
        return Int(gamma, radix: 2)! * Int(epsilon, radix: 2)!
    }

    func lifeSupportRating(_ diagnostic: [String]) -> Int {
        let oxygenGeneratorRating = selectByBitCriteria(diagnostic, .most).first!
        let co2ScrubberRating = selectByBitCriteria(diagnostic, .least).first!
        return Int(oxygenGeneratorRating, radix: 2)! * Int(co2ScrubberRating, radix: 2)!
    }

    func selectByBitCriteria(_ diagnostic: [String], _ common: Common) -> [String] {
        var d = diagnostic
        for i in 0..<d[0].count {
            var zero = 0, one = 0
            for number in d {
                if number[i] == "0" { zero += 1 }
                if number[i] == "1" { one += 1 }
            }
            let bit: String
            switch common {
            case .most:
                bit = one >= zero ? "0" : "1"
            case .least:
                bit = one < zero ? "0" : "1"
            }
            d.removeAll { $0[i] == bit }
            if d.count == 1 { return d }
        }
        return []
    }

    func generatePartOne() -> String {
        guard let input = input else { return "" }
        let result = powerConsumption(input)
        return String(result)
    }

    func generatePartTwo() -> String {
        guard let input = input else { return "" }
        let result = lifeSupportRating(input)
        return String(result)
    }

}

extension BinaryDiagnostic {
    enum Common {
        case most
        case least
    }
}
