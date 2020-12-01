
import Foundation


struct Amplifier {

    let identifier: String
    let phaseSetting: Int
    var computer: IntcodeComputer

    var output: Int {
        return computer.outputs.last!
    }
    var input = 0 {
        didSet {
            computer.inputs.append(input)
        }
    }

    init(identifier: String, phaseSetting: Int, program: [Int]? = nil) {
        self.identifier = identifier
        self.phaseSetting = phaseSetting
        self.computer = IntcodeComputer(program: program)
        self.computer.inputs.append(phaseSetting)
    }
}


struct AmplifierCircuit {

    var computer: IntcodeComputer!

    func highestSignal(_ program: [Int], _ sequence: [Int]) -> Int {
        var higest = Int.min
        let combos = permutations(sequence)
        for combo in combos {
            let output = run(program, combo)
            if output > higest {
                higest = output
            }
        }
        return higest
    }

    mutating func highestSignalFeedback(_ program: [Int], _ sequence: [Int]) -> Int {
        var higest = 0

        let combos = permutations(sequence)
        for combo in combos {
            print(combo)
            let output = runFor(program, combo)
            if output > higest {
                higest = output
            }
        }
        return higest
    }

    mutating func runFor(_ program: [Int], _ sequence: [Int]) -> Int {
        var amplifiers = [
            Amplifier(
                identifier: "A",
                phaseSetting: sequence[0],
                program: program
            ),
            Amplifier(
                identifier: "B",
                phaseSetting: sequence[1],
                program: program
            ),
            Amplifier(
                identifier: "C",
                phaseSetting: sequence[2],
                program: program
            ),
            Amplifier(
                identifier: "D",
                phaseSetting: sequence[3],
                program: program
            ),
            Amplifier(
                identifier: "E",
                phaseSetting: sequence[4],
                program: program
            ),
        ]
        return run2(program, &amplifiers, 0)
    }

    mutating func run2(_ program: [Int], _ amplifiers: inout [Amplifier], _ input: Int) -> Int {
        var output = input
        var lastType: OpcodeType?
        while lastType != .terminate {
            for i in 0..<amplifiers.count {
                amplifiers[i].input = output
//                print("output: \(output)")
                print("Amp: \(amplifiers[i].identifier)")
//                print("i: \(amplifiers[i].computer.i)")

                _ = amplifiers[i].computer.execute2()
                output = amplifiers[i].output
                lastType = amplifiers[i].computer.lastOpcodeType
            }
        }
        return output
    }
    func run(_ program: [Int], _ sequence: [Int]) -> Int {
        let amplifiers = [
            Amplifier(identifier: "A", phaseSetting: sequence[0]),
            Amplifier(identifier: "B", phaseSetting: sequence[1]),
            Amplifier(identifier: "C", phaseSetting: sequence[2]),
            Amplifier(identifier: "D", phaseSetting: sequence[3]),
            Amplifier(identifier: "E", phaseSetting: sequence[4]),
        ]
        var output = 0
        for amp in amplifiers {
            var computer = IntcodeComputer()
            computer.inputs.append(amp.phaseSetting)
            computer.inputs.append(output)
            _ = computer.execute(program: program)
            output = computer.outputs[0]
        }
        return output
    }

    private func permutations(_ array: [Int]) -> [[Int]] {
        let n = array.count
        var result: [[Int]] = []
        guard n > 0 else { return [[]] }

        for i in 0..<n {
            let before = Array(array[0..<i])
            let after  = Array(array[i+1..<n])
            let lastLevel = permutations(before + after)
            result += lastLevel.map { $0 + [array[i]] }
        }
        return result
    }

}
