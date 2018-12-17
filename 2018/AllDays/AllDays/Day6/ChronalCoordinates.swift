
import Foundation


extension Array where Element == [Area] {
    func flipped() -> [[Area]] {
        var copy = self
        for i in 0..<self.count {
            for j in 0..<self.count {
                copy[j][i] = self[i][j]
            }
        }
        return copy
    }
}

extension Array where Element == [Int] {
    func highestValue() -> Int {
        guard self.count != 0 else { return 0 }
        var max = 0
        for array in self {
            if array.max()! > max {
                max = array.max()!
            }
        }
        return max
    }
}

struct Area: CustomStringConvertible {
    var ID: Int = 0
    var belongToID: Int = 0
    var description: String {
        if ID != 0 { return "X" }
        if belongToID == 0 { return "." }
        return String(belongToID)
    }
    var description2: String {
        if ID != 0 { return String(ID) }
        return "."
    }
}

class ChronalCoordinates: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArray(fromFile: input)
        let coordinates = array.map { (s) -> [Int] in
            let a = s.split(separator: ",")
            return [
                Int(a[0].trimmingCharacters(in: .whitespaces))!,
                Int(a[1].trimmingCharacters(in: .whitespaces))!,
            ]
        }
        createGridWith(coordinates: coordinates)
        decideAreaBelongingToCoords()
        return String(largestArea())
    }

    func generatePartTwo(fromFile input: String) -> String {
        return ""
    }


    var grid = [[Area]]()
    var coords = [[Int]]()

    func createGridWith(coordinates coords: [[Int]]) {
        self.coords = coords
        let highestValue = coords.highestValue()
        grid = Array(
            repeating: Array(
                repeating: Area(),
                count: highestValue + 1
            ),
            count: highestValue + 1
        )
        for i in 0..<coords.count {
            let array = coords[i]
            grid[array[0]][array[1]].ID = i + 1
        }
    }

    func decideAreaBelongingToCoords() {
        for i in 0..<grid.count {
            for j in 0..<grid.count {
                var closestDistance = Int.max
                for k in 0..<coords.count {
                    let xD = abs(i - coords[k][0])
                    let yD = abs(j - coords[k][1])
                    if xD + yD == closestDistance {
                        grid[i][j].belongToID = 0
                    }
                    else if xD + yD < closestDistance {
                        closestDistance = xD + yD
                        grid[i][j].belongToID = k + 1
                    }
                }
            }
        }
//        for aoeu in grid.flipped() {
//            print(aoeu)
//        }
    }

    func largestArea() -> Int {
        var dict = [Int:Int]()
        var deadIDs = Set<Int>()
        for i in 0..<grid.count {
            for j in 0..<grid.count {
                let ID = grid[i][j].belongToID
                if i == 0 || i == grid.count-1 || j == 0 || j == grid.count-1 {
                    deadIDs.insert(ID)
                    dict.removeValue(forKey: ID)
                    continue
                }
                if deadIDs.contains(where: { $0 == ID }) {
                    continue
                }
                if let value = dict[ID] {
                    dict[ID] = value + 1
                } else {
                    dict[ID] = 1
                }
            }
        }
        return dict.values.max()!
    }
}
