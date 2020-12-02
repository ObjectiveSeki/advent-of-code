
import Foundation


struct ReportRepair: FileReader, Generatable {
    func expenceDouble(array: [Int]) -> Int {
        for x in array {
            for y in array {
                if x + y == 2020 {
                    return x * y
                }
            }
        }
        return 0
    }
    func expenceTripple(array: [Int]) -> Int {
        for x in array {
            for y in array {
                for z in array {
                    if x + y + z == 2020 {
                        return x * y * z
                    }
                }
            }
        }
        return 0
    }

    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input).map { Int($0)! }
        let hej = expenceDouble(array: array)
        return String(hej)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input).map { Int($0)! }
        let hej = expenceTripple(array: array)
        return String(hej)
    }
}
