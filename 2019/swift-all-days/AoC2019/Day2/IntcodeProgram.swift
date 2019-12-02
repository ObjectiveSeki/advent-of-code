
import Foundation


enum Opcode: Int {
    case add = 1
    case multiply = 2
    case terminate = 99
}

struct IntcodeProgram: FileReader, Generatable {


    // MARK: Logic

    func execute(array: [Int]) -> [Int] {
        var newArray = array
        for index in stride(from: 0, to: array.count, by: 4) {
            let code = Opcode(rawValue: newArray[index + 0])
            if code == .terminate {
                break
            }
            let input1 = newArray[index + 1]
            let input2 = newArray[index + 2]
            let position = newArray[index + 3]

            var newValue = 0
            if code == .add {
                newValue = newArray[input1] + newArray[input2]
            } else if code == .multiply {
                newValue = newArray[input1] * newArray[input2]
            }
            newArray[position] = newValue
        }

        return newArray
    }

    func findNounAndVerb(array: [Int]) -> (Int, Int) {
        var arr = array
        for i in 0...99 {
            for j in 0...99 {
                arr[1] = i
                arr[2] = j
                let newArray = execute(array: arr)
                if newArray[0] == 19690720 {
                    return (i, j)
                }
            }
        }
        return (0, 0)
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        var array = stringArrayComma(fromFile: input).map { Int($0)! }
        array[1] = 12
        array[2] = 2
        let newArray = execute(array: array)
        return String(newArray[0])
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayComma(fromFile: input).map { Int($0)! }
        let found = findNounAndVerb(array: array)
        return String(100 * found.0 + found.1)
    }
    
}
