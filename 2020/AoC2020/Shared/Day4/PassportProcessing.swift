
import Foundation


struct Passport {

    var dict = [String: String]()
    var birthYear: String? { return dict["byr"] }
    var issueYear: String? { return dict["iyr"] }
    var expirationYear: String? { return dict["eyr"] }
    var height: String? { return dict["hgt"] }
    var hairColor: String? { return dict["hcl"] }
    var eyeColor: String? { return dict["ecl"] }
    var passportID: String? { return dict["pid"] }
    var countryID: String? { return dict["cid"] }

    init(array: [String]) {
        for item in array {
            let key = item.split(separator: ":")[0].description
            let value = item.split(separator: ":")[1].description
            self.dict[key] = value
        }
    }

    var isValidFast :Bool {
        if
            let _ = birthYear,
            let _ = issueYear,
            let _ = expirationYear,
            let _ = height,
            let _ = hairColor,
            let _ = eyeColor,
            let _ = passportID {
            return true
        }
        return false
    }

    var isValidStrict :Bool {
        guard
            let birthYear = Int(birthYear ?? "0"),
            let issueYear = Int(issueYear ?? "0"),
            let expirationYear = Int(expirationYear ?? "0"),
            let height = height,
            let hairColor = hairColor,
            let eyeColor = eyeColor,
            let passportID = passportID
        else { return false }

        if birthYear < 1920 || birthYear > 2002 { return false }
        if issueYear < 2010 || issueYear > 2020 { return false }
        if expirationYear < 2020 || expirationYear > 2030 { return false }

        if !validHeight(height: height) { return false }
        if !validHairColor(color: hairColor) { return false }
        if !validEyeColor(color: eyeColor) { return false }
        if !validPassportID(hej: passportID) { return false }

        return true
    }

    private func validHeight(height: String) -> Bool {
        if height.contains("in") {
            let number = height.dropLast(2)
            if let n = Int(number) {
                if n >= 59 && n <= 76 { return true }
            }
        }
        if height.contains("cm") {
            let number = height.dropLast(2)
            if let n = Int(number) {
                if n >= 150 && n <= 193 { return true }
            }
        }
        return false
    }

    private func validEyeColor(color: String) -> Bool {
        let validOnes = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
        return validOnes.contains(color)
    }

    private func validHairColor(color: String) -> Bool {
        let char = color[color.index(color.startIndex, offsetBy: 0)]
        if char != "#" { return false }
        for i in 1...6 {
            let char = color[color.index(color.startIndex, offsetBy: i)]
            let isDigit = (Int(String(char)) != nil) ? true : false
            let isLetter = char >= "a" && char <= "z"
            if !isDigit && !isLetter { return false }
        }
        return true
    }

    private func validPassportID(hej: String) -> Bool {
        if hej.count != 9 { return false }
        guard let _ = Int(hej) else { return false}
        return true
    }

}

struct PassportProcessing:FileReader, Generatable {

    func validPassports(from input: [String]) -> Int {
        let passportArray = input
            .split(separator: "")
            .map { $0.map { $0.split(separator: " ") } }
            .map { $0.flatMap { $0 } }
            .map { $0.map { $0.description } }
        var validOnes = 0
        for array in passportArray {
            let p = Passport(array: array)
            if p.isValidFast {
                validOnes += 1
            }
        }
        return validOnes
    }

    func validPassportsStrict(from input: [String]) -> Int {
        let passportArray = input
            .split(separator: "")
            .map { $0.map { $0.split(separator: " ") } }
            .map { $0.flatMap { $0 } }
            .map { $0.map { $0.description } }
        var validOnes = 0
        for array in passportArray {
            let p = Passport(array: array)
            if p.isValidStrict {
                validOnes += 1
            }
        }
        return validOnes
    }

    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = validPassports(from: array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = validPassportsStrict(from: array)
        return String(result)
    }
}
