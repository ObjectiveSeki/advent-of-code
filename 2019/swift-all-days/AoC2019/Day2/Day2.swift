
import Foundation


struct Day2: FileReader, Generatable {
    func generatePartOne(fromFile input: String) -> String {
        var array = stringArrayComma(fromFile: input).map { Int($0)! }
        array[1] = 12
        array[2] = 2
        var computer = IntcodeComputer()
        let newArray = computer.execute(program: array)
        return String(newArray[0])
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayComma(fromFile: input).map { Int($0)! }
        let found = findNounAndVerb(array: array)
        return String(100 * found.0 + found.1)
    }

    private func findNounAndVerb(array: [Int]) -> (Int, Int) {
        var arr = array
        for i in 0...99 {
            for j in 0...99 {
                arr[1] = i
                arr[2] = j
                var computer = IntcodeComputer()
                let newArray = computer.execute(program: arr)
                if newArray[0] == 19690720 {
                    return (i, j)
                }
            }
        }
        return (0, 0)
    }

}
