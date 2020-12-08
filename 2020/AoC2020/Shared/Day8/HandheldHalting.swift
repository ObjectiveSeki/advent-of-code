
import Foundation


enum Operation: String {
    case nop
    case acc
    case jmp
}

struct Instruction {
    let op: Operation
    let value: Int
}

class HandheldHalting: FileReader, Generatable {
    func calculate(from input: [String]) -> Int {
        let instructions = input
            .map { $0.split(separator: " ") }
            .map { (arr) -> Instruction in
                return Instruction(
                    op: Operation(rawValue: String(arr[0]))!,
                    value: Int(arr[1])!
                )
            }
        return runInstructions(instructions).acc
    }

    func calculate2(from input: [String]) -> Int {
        let instructions = input
            .map { $0.split(separator: " ") }
            .map { (arr) -> Instruction in
                return Instruction(
                    op: Operation(rawValue: String(arr[0]))!,
                    value: Int(arr[1])!
                )
            }
        var toSwitch = [Int]()
        for i in 0..<instructions.count {
            if instructions[i].op == .jmp { toSwitch.append(i) }
            if instructions[i].op == .nop { toSwitch.append(i) }
        }
        for toS in toSwitch {
            var copy = instructions
            copy[toS] = switchInstruction(copy[toS])
            let result = runInstructions(copy)
            if result.finished == true {
                return result.acc
            }
        }
        return 0
    }

    private func switchInstruction(_ instr: Instruction) -> Instruction {
        if instr.op == .jmp {
            return Instruction(op: .nop, value: instr.value)
        }
        if instr.op == .nop {
            return Instruction(op: .jmp, value: instr.value)
        }
        return instr
    }

    private func runInstructions(_ instructions: [Instruction]) -> (acc: Int, finished: Bool) {
        var accumulator = 0
        var i = 0
        var visitedInstructions = [Int]()

        while i < instructions.count {
            if visitedInstructions.contains(i) {
                return (accumulator, false)
            }
            visitedInstructions.append(i)
            let instr = instructions[i]
            switch instr.op {
            case .acc:
                accumulator += instr.value
            case .jmp:
                i += instr.value
                continue
            case .nop:
                break
            }
            i += 1
        }
        return (accumulator, true)
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate(from: array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate2(from: array)
        return String(result)
    }
}
