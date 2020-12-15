
import Foundation


extension String {
    func binaryPadded(toSize: Int) -> String {
        var padded = self
        for _ in 0..<(toSize - self.count) {
            padded = "0" + padded
        }
        return padded
    }
    func toBinary() -> Int? {
        return Int(self, radix: 2)
    }
}

extension Int {
    func toBinary() -> String {
        return String(self, radix: 2)
    }
}


class DockingData: FileReader, Generatable {

    func calculate(_ input: [String]) -> Int {
        var mask = ""
        var memory = [String:String]()

        for inp in input {
            let components = inp.split(separator: " ")
            if inp.prefix(4) == "mask" {
                mask = String(components[2])
            }
            else if inp.prefix(3) == "mem" {
                let mem = String(
                    components[0]
                        .dropFirst()
                        .dropFirst()
                        .dropFirst()
                        .dropFirst()
                        .dropLast()
                )
                let decimalValue = Int(components[2])!
                let value = apply(mask: mask, to: decimalValue)
                memory[mem] = value
            }
        }
        return memory
            .map { $1 }
            .map { $0.toBinary()! }
            .reduce(0, +)
    }

    func calculate2(_ input: [String]) -> Int {
        var mask = ""
        var memory = [String:String]()

        for inp in input {
            let components = inp.split(separator: " ")
            if inp.prefix(4) == "mask" {
                mask = String(components[2])
            }
            else if inp.prefix(3) == "mem" {
                let mem = String(
                    components[0]
                        .dropFirst()
                        .dropFirst()
                        .dropFirst()
                        .dropFirst()
                        .dropLast()
                )
                let decimalValue = Int(components[2])!
                let value = apply(mask: mask, to: decimalValue)
                memory[mem] = value
            }
        }
        return memory
            .map { $1 }
            .map { $0.toBinary()! }
            .reduce(0, +)
//        return 0
    }



    func apply(mask: String, to decimalValue: Int) -> String {
        let decimalString = decimalValue
            .toBinary()
            .binaryPadded(toSize: mask.count)

        let maskArr = Array(mask)
        var valueArr = Array(decimalString)

        for i in 0..<maskArr.count {
            if maskArr[i] == "X" { continue }
            valueArr[i] = maskArr[i]
        }
        return valueArr
            .map { String($0) }
            .joined()
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate(array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate(array)
        return String(result)
    }

}
