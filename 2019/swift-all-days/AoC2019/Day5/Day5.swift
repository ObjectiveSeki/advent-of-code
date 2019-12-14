
import Foundation


struct Day5: FileReader, Generatable {
    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayComma(fromFile: input).map { Int($0)! }
        var computer = IntcodeComputer()
        computer.input = 1
        _ = computer.execute(program: array)
        print(computer.outputs)
        return computer.outputs.last!.description
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayComma(fromFile: input).map { Int($0)! }
        var computer = IntcodeComputer()
        computer.input = 5
        _ = computer.execute(program: array)
        print(computer.outputs)
        return computer.outputs.last!.description
    }
}
