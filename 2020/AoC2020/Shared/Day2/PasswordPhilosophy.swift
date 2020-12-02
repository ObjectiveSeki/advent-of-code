
import Foundation


struct PasswordPhilosophy: FileReader, Generatable {
    

    func validOnes(passwords: [String]) -> [String] {
        var validOnes = [String]()
        for s in passwords {
            if validPassword(s: s) {
                validOnes.append(s)
            }
        }
        return validOnes
    }
    func validOnes2(passwords: [String]) -> [String] {
        var validOnes = [String]()
        for s in passwords {
            if validPassword2(s: s) {
                validOnes.append(s)
            }
        }
        return validOnes
    }
    func validPassword(s: String) -> Bool {
        let numbers = s
            .split(separator: " ")[0]
            .split(separator: "-")
            .map { Int($0)! }
        let letter = s
            .split(separator: " ")[1]
            .first
        let password = s
            .split(separator: " ")[2]
        let instances = password
            .filter { $0 == letter }
            .count
        return instances >= numbers[0] && instances <= numbers[1]
    }

    func validPassword2(s: String) -> Bool {
        let numbers = s
            .split(separator: " ")[0]
            .split(separator: "-")
            .map { Int($0)! }
        let letter = s
            .split(separator: " ")[1]
            .first
        let password = s
            .split(separator: " ")[2]
        let first = password[
            password.index(password.startIndex, offsetBy: numbers[0]-1)
        ]
        let second = password[
            password.index(password.startIndex, offsetBy: numbers[1]-1)
        ]
        var valid = false
        if letter == first { valid = !valid }
        if letter == second { valid = !valid }
        return valid
    }

    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let hej = validOnes(passwords: array)
        return String(hej.count)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let hej = validOnes2(passwords: array)
        return String(hej.count)
    }
}
