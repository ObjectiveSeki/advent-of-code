
import Foundation


class HandyHaversacks: FileReader, Generatable {

    var dict = [String: [String]]()

    func calculate(_ bag: String, _ input: [String]) -> Int {
        let rules = input
            .map { $0.split(separator: ",") }
            .map { $0.map { $0.trimmingCharacters(in: .whitespaces) } }
            .map { $0.map { $0.split(separator: " ") } }


        for rule in rules {
            let key = [rule[0][0], rule[0][1]].joined()
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
            if dict[key] != nil {
                dict[key] = dict[key]! + values
            } else {
                dict[key] = values
            }
        }

        for key in dict.keys {
            print(key + ": " + dict[key]!.description)
        }

        let result = xxx(value: bag)
        return result
    }

    private func xxx(value: String) -> Int {
        let m = dict
            .filter { $0.value.contains(value) }
            .keys
        print(m.description)

        if m.count == 0 { return 1 }
        var count = 0
        for x in m {
            count += xxx(value: x)
        }
        return count
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate("shinygold", array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate("shinygold", array)
        return String(result)
    }

}
