
import Foundation


struct Parameter {
    let value: Int
    let mode: ParameterMode
}

enum ParameterMode: Int {
    case position = 0
    case immediate = 1
}

enum OpcodeType: Int {
    case add = 1
    case multiply = 2
    case store = 3
    case output = 4
    case jumpIfTrue = 5
    case jumpIfFalse = 6
    case lessThan = 7
    case equals = 8
    case terminate = 99
}

struct Opcode {

    let type: OpcodeType
    let paramModes: [ParameterMode]

    init(number: Int) {
        if number == 99 {
            type = .terminate
            paramModes = []
        } else if number == 1 || number == 2 {
            type = OpcodeType(rawValue: number)!
            paramModes = [.position, .position, .position]
        } else if number == 3 || number == 4 {
            type = OpcodeType(rawValue: number)!
            paramModes = [.position]
        } else if number == 5 || number == 6 {
            type = OpcodeType(rawValue: number)!
            paramModes = [.position, .position]
        } else if number == 7 || number == 8 {
            type = OpcodeType(rawValue: number)!
            paramModes = [.position, .position, .position]
        } else {
            let code = number % 10
            type = OpcodeType(rawValue: code)!
            let firstMode = Int(number / 100) % 10
            let secondMode = Int(number / 1000) % 10
            let thirdMode = Int(number / 10000) % 10
            paramModes = [
                ParameterMode(rawValue: firstMode)!,
                ParameterMode(rawValue: secondMode)!,
                ParameterMode(rawValue: thirdMode)!
            ]
        }
    }
}


struct IntcodeComputer {

    var input = Int.min
    var outputs = [Int]()


    // MARK: Logic

    mutating func execute(program: [Int]) -> [Int] {
        var progCopy = program
        var i = 0

        while i < progCopy.count {
            let opcode = Opcode(number: progCopy[i + 0])
            if opcode.type == .terminate {
                break
            }

            if opcode.type == .store {
                let storeIndex = progCopy[i+1]
                progCopy[storeIndex] = input
                i += 2
            } else if opcode.type == .output {
                let p = Parameter(
                    value: progCopy[i+1],
                    mode: opcode.paramModes[0]
                )
                let v1 = valuesFrom(parameter: p, program: progCopy)
                outputs.append(v1)
                i += 2
            }

            else if opcode.type == .jumpIfTrue || opcode.type == .jumpIfFalse {
                var params = [Parameter]()
                for (index, mode) in opcode.paramModes.enumerated() {
                    let p = Parameter(
                        value: progCopy[i+index+1],
                        mode: mode
                    )
                    params.append(p)
                }
                let v1 = valuesFrom(parameter: params[0], program: progCopy)
                let v2 = valuesFrom(parameter: params[1], program: progCopy)
                jump(opcode, v1, v2, &i)
            }

            else if opcode.type == .multiply ||
                opcode.type == .add ||
                opcode.type == .equals ||
                opcode.type == .lessThan {
                var params = [Parameter]()
                for (index, mode) in opcode.paramModes.enumerated() {
                    let p = Parameter(
                        value: progCopy[i+index+1],
                        mode: mode
                    )
                    params.append(p)
                }
                let v1 = valuesFrom(parameter: params[0], program: progCopy)
                let v2 = valuesFrom(parameter: params[1], program: progCopy)
                let r = result(from: opcode, v1, v2)
                write(
                    result: r,
                    param: params[2],
                    program: &progCopy,
                    index: i
                )
                i += 1 + params.count
            }
        }
        return progCopy
    }


    // MARK: Helper Methods

    private func valuesFrom(parameter: Parameter, program: [Int]) -> Int {
        switch parameter.mode {
        case .position:
            return program[parameter.value]
        case .immediate:
            return parameter.value
        }
    }

    private func result(from opcode: Opcode, _ v1: Int, _ v2: Int) -> Int {
        switch opcode.type {
        case .add:
            return v1 + v2
        case .multiply:
            return v1 * v2
        case .equals:
            return v1 == v2 ? 1 : 0
        case .lessThan:
            return v1 < v2 ? 1 : 0
        default:
            fatalError()
        }
    }

    private func write(result: Int, param: Parameter, program: inout [Int], index: Int) {
        switch param.mode {
        case .position:
            program[param.value] = result
        case .immediate:
            program[index+3] = result
        }
    }

    private func jump(_ opcode: Opcode, _ v1: Int, _ v2: Int, _ i: inout Int) {
        switch opcode.type {
        case .jumpIfTrue:
            if v1 != 0 {
                i = v2
            } else {
                i += 1 + 2
            }
        case .jumpIfFalse:
            if v1 == 0 {
                i = v2
            } else {
                i += 1 + 2
            }
        default:
            fatalError()
        }
    }

}
