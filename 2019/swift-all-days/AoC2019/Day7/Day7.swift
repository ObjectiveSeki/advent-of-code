
import Foundation


struct Day7: FileReader, Generatable {
    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayComma(fromFile: input).map { Int($0)! }
        let hej = AmplifierCircuit()
        let hejj = hej.highestSignal(array, [0,1,2,3,4])
        return hejj.description

        // 28076169
        // too high
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayComma(fromFile: input).map { Int($0)! }
        return ""
    }
}
