
import Foundation

class Node {
    var value = 0
    var parent: Node?
    var children = [Node]()
    func takes(_ array: [Int]) {
        value = array[0]
        let diff = value + 3
        var values = [Int]()
        for i in 0+1..<array.count {
            if array[i] <= diff {
                values.append(array[i])
            } else {
                break
            }
        }
        for i in 0..<values.count {
            let n = Node()
            n.takes(Array(array[1+i...array.count-1]))
            children.append(n)
        }

    }
}

class AdapterArray: FileReader, Generatable {

    func calculate(_ input: [String]) -> Int {
        let result = calculateDiffs(input)
        return result.diff1 * result.diff3
    }

    var arrayList = [[Int]]()
    var splits = 0

    func rec2(_ arr: [Int]) -> Void {
        let value = arr[0]
//        print(value)
        let diff = value + 3
        var values = 0
        for i in 1...3 {
            if i == arr.count { break }
            if arr[i] <= diff {
                values += 1
                if values > 1 {
                    splits += 1
                }
                let restOfArray = Array(arr[i...arr.count-1])
                rec2(restOfArray)
            }
        }
    }

    func rec(_ arr: [Int]) -> Void {
        for i in 0..<arr.count-1 {
            let value = arr[i]
            let diff = value + 3
//            var values = [Int]()
            var values2 = 0
            for j in i+1..<arr.count {
                if arr[j] <= diff {
//                    values.append(arr[i])
                    values2 += 1
                    if values2 > 1 {
                        let restOfArray = Array(arr[1+j...arr.count-1])
                        arrayList.append(restOfArray)
                        rec2(restOfArray)
                    }
                }
                else {
                    break
                }
            }
        }
    }

    func calculate2(_ input: [String]) -> Int {
        var sorted = input
            .map { Int($0)! }
            .sorted()
        let chargerOutlet = 0
        let myDevice = sorted.last! + 3
        sorted.insert(chargerOutlet, at: 0)
        sorted.insert(myDevice, at: sorted.count)
        arrayList.append(sorted)
        splits += 1
        rec2(sorted)
        return splits

        return arrayList.count
//        let node = Node()
//        node.takes(sorted)
//        return yoh(node)

//        var paths = 1
//        for i in 0..<sorted.count-1 {
//            let value = sorted[i]
//            let diff = value + 3
//            var values = [Int]()
//            for j in i+1..<sorted.count {
//                if sorted[j] <= diff {
//                    values.append(sorted[i])
//                } else {
//                    break
//                }
//            }
//            paths += values.count - 1
//        }
//        return paths
    }

    func yoh(_ node: Node) -> Int {
        if node.children.count == 0 { return 1 }
        var count = 0
        for child in node.children {
            count += yoh(child)
        }
        return count
    }


    func calculateDiffs(_ input: [String]) -> (diff1: Int, diff3: Int) {
        var sorted = input
            .map { Int($0)! }
            .sorted()
        let chargerOutlet = 0
        let myDevice = sorted.last! + 3
        sorted.insert(chargerOutlet, at: 0)
        sorted.insert(myDevice, at: sorted.count)

        var diff1 = 0
        var diff3 = 0
        for i in 1..<sorted.count {
            let diff = sorted[i]-sorted[i-1]
            if diff == 1 { diff1 += 1 }
            if diff == 3 { diff3 += 1 }
        }
        return (diff1, diff3)
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate(array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate2(array)
        return String(result)
    }
}
