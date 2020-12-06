
import Foundation


struct CustomCustoms: FileReader, Generatable {

    func countNumberOfQuestions(from input: [String]) -> Int {
        let array = input
            .split(separator: "")
            .map { $0.map { $0.split(separator: " ") } }
            .map { $0.flatMap { $0 } }
            .map { $0.map { $0.description } }
            .map { $0.joined() }
            .map { Array(Set($0)) }
        var count = 0
        for a in array {
            count += a.count
        }
        return count
    }

    func countEveryoneAnsweredYes(from input: [String]) -> Int {
        let setMatrix = input
            .split(separator: "")
            .map { $0.map { $0.split(separator: " ") } }
            .map { $0.flatMap { $0 } }
            .map { $0.map { $0.description } }
            .map { $0.joined() }
            .map { Array(Set($0)) }
        let arrayMatrix = input
            .split(separator: "")
            .map { $0.map { $0.split(separator: " ") } }
            .map { $0.flatMap { $0 } }
            .map { $0.map { $0.description } }

        var total = 0
        for i in 0..<arrayMatrix.count {
            for answer in setMatrix[i] {
                var everyoneAnswered = true
                for j in 0..<arrayMatrix[i].count {
                    if !arrayMatrix[i][j].contains(answer) {
                        everyoneAnswered = false
                    }
                }
                if everyoneAnswered {
                    total += 1
                }
            }
        }
        return total
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = countNumberOfQuestions(from: array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = countEveryoneAnsweredYes(from: array)
        return String(result)
    }

}
