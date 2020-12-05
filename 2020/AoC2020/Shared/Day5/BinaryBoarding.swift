
import Foundation


extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}

struct BinaryBoarding: FileReader, Generatable {

    let rows = Array(0...127)
    let columns = Array(0...7)
    let multiplier = 8

    func calculateSeatID(from spec: String) -> Int {
        var rows = self.rows
        var columns = self.columns

        for letter in spec {
            let splitR = rows.split()
            let splitC = columns.split()
            switch letter {
            case "F":
                rows = splitR.left
            case "B":
                rows = splitR.right
            case "L":
                columns = splitC.left
            case "R":
                columns = splitC.right
            default:
                break
            }
        }
        return rows[0] * multiplier + columns[0]
    }

    func highestSeatID(from seatSpecifications: [String]) -> Int {
        var highest = Int.min
        for spec in seatSpecifications {
            let number = calculateSeatID(from: spec)
            if number > highest {
                highest = number
            }
        }
        return highest
    }

    func calculateMySeatID(from input: [String]) -> Int {
        let seatIDs = input
            .map { calculateSeatID(from: $0) }
            .sorted()
        var myBuddies = [Int]()
        for i in 1...seatIDs.count-2 {
            let ID = seatIDs[i]
            if
                ID - 1 != seatIDs[i-1] ||
                ID + 1 != seatIDs[i+1] {
                myBuddies.append(ID)
            }
        }
        return (myBuddies[0] + myBuddies[1]) / 2
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = highestSeatID(from: array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculateMySeatID(from: array)
        return String(result)
    }

}
