
import Foundation


struct FrequencyCalibrator: FileReader {

    func resultingFrequency(fromFile input: String) -> Int {
        let array = stringArray(fromFile: input).map { Int($0)! }
        return resultingFrequency(from: array)
    }

    func firstFrequencyReachedTwice(fromFile input: String) -> Int {
        let array = stringArray(fromFile: input).map { Int($0)! }
        print(array)
        return firstFrequencyReachedTwice(from: array)
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
            print("i: \(i)")
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
