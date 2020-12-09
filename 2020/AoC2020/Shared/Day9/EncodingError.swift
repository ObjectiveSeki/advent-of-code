
import Foundation


class EncodingError: FileReader, Generatable {

    // Calculate ALL the sums and see if the villain is not among them
    func calculate1Slow(_ input: [String], _ preamble: Int) -> Int {
        let array = input.map { Int($0) }
        var villain = 0
        for i in preamble..<array.count {
            let valueToCheck = array[i]!
            var validSums = [Int]()
            for j in i-preamble..<i {
                for k in i-preamble..<i {
                    let v1 = array[j]!
                    let v2 = array[k]!
                    if v1 == v2 { continue }
                    let sum = v1 + v2
                    if validSums.contains(sum) { continue }
                    validSums.append(sum)
                }
            }
            if validSums.contains(valueToCheck) { continue }
            villain = valueToCheck
            break
        }
        return villain
    }

    // Sorting the preamble and checking for the correct sum from each side and moving in
    func calculate1Fast(_ input: [String], _ preamble: Int) -> Int {
        let array = input.map { Int($0) }
        var villain = 0
        for i in preamble..<array.count {
            let valueToCheck = array[i]!
            let a = array[i-preamble..<i].sorted { $0! < $1! }
            var l = 0;
            var r = a.count - 1;
            var found = false
            while (l < r) {
                if a[l]! + a[r]! == valueToCheck {
                    found = true
                    break
                }
                else if a[l]! + a[r]! < valueToCheck {
                    l += 1
                }
                else { // a[l] + a[r] > valueToCheck
                    r -= 1
                }
            }
            if !found {
                villain = valueToCheck
                break
            }
        }
        return villain
    }

    func calculate2(_ input: [String], _ preamble: Int) -> Int {
        let villain = calculate1Fast(input, preamble)
        let array = input.map { Int($0) }
        // Possible contiguous set starting at each i
        for i in 0..<array.count {
            var values = [Int]()
            var j = i
            // Keep add values while the sum is less than villain
            while values.reduce(0, +) < villain {
                values.append(array[j]!)
                j += 1
            }
            // If the sum is exactly villain, we're home
            if values.reduce(0, +) == villain {
                let sorted = values.sorted { $0 < $1 }
                return sorted.first! + sorted.last!
            }
        }
        return 0
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate1Fast(array, 25)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate2(array, 25)
        return String(result)
    }

}
