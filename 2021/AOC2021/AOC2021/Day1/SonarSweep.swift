
import Foundation

struct SonarSweep: FileReader {

    var array: [Int]? = nil
    init(inputFile: String? = nil) {
        guard let file = inputFile else { return }
        array = stringArrayNewLine(fromFile: file).map { Int($0)! }
    }

    func deptIncreases(list: [Int]) -> Int {
        var count = 0
        var lastDept = list.first!
        for dept in list {
            if dept > lastDept { count += 1 }
            lastDept = dept
        }
        return count
    }

    func deptWindowIncreases(list: [Int]) -> Int {
        var dict = [Int:[Int]]()
        for i in 0..<list.count-2 {
            dict[i] = [list[i], list[i+1], list[i+2]]
        }
        var count = 0
        var lastDept = dict[0]!.reduce(0) { $0 + $1 }
        for window in dict.sorted(by: { $0.key < $1.key }) {
            let dept = window.value.reduce(0) { $0 + $1 }
            if dept > lastDept { count += 1 }
            lastDept = dept
        }
        return count
    }


    // MARK: Generatable

    func generatePartOne() -> String {
        guard let array = array else { return "" }
        let result = deptIncreases(list: array)
        return String(result)
    }

    func generatePartTwo() -> String {
        guard let array = array else { return "" }
        let result = deptWindowIncreases(list: array)
        return String(result)
    }

}
