
import Foundation


struct IDScanner: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArray(fromFile: input)
        return String(checksum(from: array))
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArray(fromFile: input)
        guard let string = almostIdentical(from: array) else { return "" }
        return string
    }

    func checksum(from array: [String]) -> Int {
        var twice = 0
        var threeTimes = 0
        for string in array {
            if letters(appears: 2, in: string) { twice += 1 }
            if letters(appears: 3, in: string) { threeTimes += 1 }
        }
        return twice * threeTimes
    }

    func letters(appears number: Int, in string: String) -> Bool {
        var dict = [Character:Int]()
        for s in string {
            if dict[s] == nil {
                dict[s] = 1
            } else {
                dict[s] = dict[s]! + 1
            }
        }
        let found = dict.first { (key, value) -> Bool in
            value == number
        }
        if let _ = found { return true }
        return false
    }

    func almostIdentical(from array: [String]) -> String? {
        for s1 in array {
            let filtered = array.filter { $0 != s1 }
            for s2 in filtered {
                if let almostIdentical = almostIdentical(s1, s2) {
                    return almostIdentical
                }
            }
        }
        return nil
    }

    func almostIdentical(_ s1: String, _ s2: String) -> String? {
        let arrC1 = s1.map { $0 }
        let arrC2 = s2.map { $0 }
        var identicals = [Character]()

        for i in 0..<arrC1.count {
            if arrC1[i] == arrC2[i] {
                identicals.append(arrC1[i])
            }
        }
        guard identicals.count >= arrC1.count - 1 else { return nil }
        return String(identicals)
    }

}
