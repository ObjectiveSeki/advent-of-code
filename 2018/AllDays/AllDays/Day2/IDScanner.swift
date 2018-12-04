
import Foundation


struct IDScanner: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArray(fromFile: input)
        return String(checksum(from: array))
    }

    func generatePartTwo(fromFile input: String) -> String {
        return ""
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

}
