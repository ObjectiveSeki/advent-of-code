
import Foundation


class RambunctiousRecitation: FileReader, Generatable {

    var turnNumbers = [Int: [Int]]()
    var game = [Int]()

    func calculate(_ input: String) -> Int {
        let workArray = input
            .split(separator: ",")
            .map { Int($0)! }
        var turnNumbers = [Int: [Int]]()
        var game = [Int]()

        for i in 1...2020 {
            let spokenNumber: Int
            if i <= workArray.count {
                spokenNumber = workArray[i-1]
            }
            else {
                let prevSpokenNumber = game.last!
                let prevPrevSpokenNumber = game.dropLast().last!

                if prevSpokenNumber == prevPrevSpokenNumber {
                    spokenNumber = 1
                }
                else if !hasBeenSpoken(x: prevSpokenNumber, inGame: game) {
                    spokenNumber = 0
                }
                else {
                    let arr = turnNumbers[prevSpokenNumber]!
                    let x = arr.last!
                    let y = arr.dropLast().last!
                    spokenNumber = x - y
                }
            }
            game.append(spokenNumber)
            if let _ = turnNumbers[spokenNumber] {
                turnNumbers[spokenNumber]!.append(i)
            } else {
                turnNumbers[spokenNumber] = [i]
            }
        }
        return game.last!
    }

    func calculate2(_ input: String) -> Int {
        let workArray = input
            .split(separator: ",")
            .map { Int($0)! }
        var turnNumbers = [Int: [Int]]()
        var game = [Int]()

        for i in 1...30000000 {
            let spokenNumber: Int
            if i <= workArray.count {
                spokenNumber = workArray[i-1]
            }
            else {
                let prevSpokenNumber = game.last!
                let prevPrevSpokenNumber = game.dropLast().last!

                if prevSpokenNumber == prevPrevSpokenNumber {
                    spokenNumber = 1
                }
                else if !hasBeenSpoken(x: prevSpokenNumber, inGame: game) {
                    spokenNumber = 0
                }
                else {
                    let arr = turnNumbers[prevSpokenNumber]!
                    let x = arr.last!
                    let y = arr.dropLast().last!
                    spokenNumber = x - y
                }
            }
            game.append(spokenNumber)
            if let _ = turnNumbers[spokenNumber] {
                turnNumbers[spokenNumber]!.append(i)
            } else {
                turnNumbers[spokenNumber] = [i]
            }
        }
        return game.last!
    }

    func numberSpokenTwiceInARow(_ game: [Int]) -> Bool {
        return game.last! == game.dropLast().last!
    }

    func hasBeenSpoken(x: Int, inGame game: [Int]) -> Bool {
        return game.dropLast().contains(x)
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = string(fromFile: input)!
        let result = calculate(array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = string(fromFile: input)!
        let result = calculate2(array)
        return String(result)
    }
}
