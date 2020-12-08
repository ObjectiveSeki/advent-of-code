
import Foundation


class HandyHaversacks: FileReader, Generatable {

    var dict = [String: [String]]()

    func calculate1(_ bag: String, _ input: [String]) -> Int {
        setupDict1(input)
        let result = countBags(key: bag)
        return Set(result).count
    }

    func calculate2(_ bag: String, _ input: [String]) -> Int {
        setupDict2(input)
        let result = countBags(key: bag)
        return result.count
    }

    private func setupDict1(_ input: [String]) {
        let rules = input
            .map { $0.split(separator: ",") }
            .map { $0.map { $0.trimmingCharacters(in: .whitespaces) } }
            .map { $0.map { $0.split(separator: " ") } }
        for rule in rules {
            let key = [rule[0][0], rule[0][1]].joined()
            let values = bags(from: rule)
            for value in values {
                if dict[value] != nil {
                    dict[value] = dict[value]! + [key]
                } else {
                    dict[value] = [key]
                }
            }
        }
    }

    private func setupDict2(_ input: [String]) {
        let rules = input
            .map { $0.split(separator: ",") }
            .map { $0.map { $0.trimmingCharacters(in: .whitespaces) } }
            .map { $0.map { $0.split(separator: " ") } }
        for rule in rules {
            let key = [rule[0][0], rule[0][1]].joined()
            let values = bags(from: rule)
            if dict[key] != nil {
                dict[key] = dict[key]! + values
            } else {
                dict[key] = values
            }
        }
    }

    private func bags(from rule: [[String.SubSequence]]) -> [String] {
        var values = [String]()
        for i in 0..<rule.count {
            if i == 0 {
                guard let multiplier = Int(rule[i][4]) else { continue }
                let value = [rule[i][5], rule[i][6]].joined()
                for _ in 0..<multiplier {
                    values.append(value)
                }
            }
            else {
                let multiplier = Int(rule[i][0])!
                let value = [rule[i][1], rule[i][2]].joined()
                for _ in 0..<multiplier {
                    values.append(value)
                }
            }
        }
        return values
    }

    private func countBags(key: String) -> [String] {
        guard var bags = dict[key] else { return [] }
        for x in bags {
            bags += countBags(key: x)
        }
        return bags
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate1("shinygold", array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate2("shinygold", array)
        return String(result)
    }

}
