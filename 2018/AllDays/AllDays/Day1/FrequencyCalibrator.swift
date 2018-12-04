
import Foundation


struct FrequencyCalibrator: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArray(fromFile: input).map { Int($0)! }
        return String(resultingFrequency(from: array))
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArray(fromFile: input).map { Int($0)! }
        return String(firstFrequencyReachedTwice(from: array))
    }


    func resultingFrequency(from array: [Int]) -> Int {
        var result = 0
        for frequencyChange in array {
            result += frequencyChange
        }
        return result
    }

    func firstFrequencyReachedTwice(from array: [Int]) -> Int {
        var result = 0, i = 0
        var calculatedFrequencies: [Int] = [result]
        while (true) {
            i += 1
            for frequencyChange in array {
                result += frequencyChange
                if calculatedFrequencies.contains(result) {
                    return result
                }
                calculatedFrequencies.append(result)
            }
        }
    }
}
