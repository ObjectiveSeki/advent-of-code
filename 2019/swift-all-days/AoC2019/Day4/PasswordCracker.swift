
import Foundation


struct OKPassword: FileReader, Generatable {

    func okOnes(from a: Int, to b: Int) -> [Int] {
        var okOnes = [Int]()
        for password in a...b {
            if isPasswordOK(password: password) {
                okOnes.append(password)
            }
        }
        return okOnes
    }
    
    func okOnesExtraRule(from a: Int, to b: Int) -> [Int] {
        var okOnes = [Int]()
        for password in a...b {
            if isPasswordOKExtraRule(password: password) {
                okOnes.append(password)
            }
        }
        return okOnes
    }

    func isPasswordOK(password: Int) -> Bool {
        var lowest = 0
        var lastDigit = -1
        var doubles = 0

        for char in String(password) {
            let digit = Int(char.description)!
            if digit < lowest {
                return false
            }
            lowest = digit
            if digit == lastDigit {
                doubles += 1
            }
            lastDigit = digit
        }
        return doubles >= 1
    }

    func isPasswordOKExtraRule(password: Int) -> Bool {
            var lowest = -1
            var foundGroup = false
            var dict = [Int : Int]()

            for char in String(password) {
                let digit = Int(char.description)!
                if digit < lowest {
                    return false
                }
                lowest = digit
                if var a = dict[digit] {
                    a += 1
                    dict[digit] = a
                } else {
                    dict[digit] = 1
                }
            }
            for digit in dict.keys {
                let numOfDig = dict[digit]!
                if numOfDig == 1 {
                    continue
                }
                if numOfDig == 2 {
                    foundGroup = true
                }
            }
            return foundGroup
        }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let s = string(fromFile: input)!
        let array = s.components(separatedBy: "-")
        let ok = okOnes(
            from: Int(array.first!)!,
            to: Int(array.last!)!
        )
        return String(ok.count)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let s = string(fromFile: input)!
        let array = s.components(separatedBy: "-")
        let ok = okOnesExtraRule(
            from: Int(array.first!)!,
            to: Int(array.last!)!
        )
        return String(ok.count)
    }
}
