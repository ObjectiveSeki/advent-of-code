
import Foundation


struct Coord {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    init(key: String) {
        let coords = key.split(separator: ",")
        x = Int(coords[0])!
        y = Int(coords[1])!
    }
    func asKey() -> String {
        return String(x) + "," + String(y)
    }
}

struct TobogganTrajectory: FileReader, Generatable {

    func calculateTrees(input: [String], increment: (Int, Int)) -> Int {
        let grid = input.map { Array($0) }
        let xIncrement = increment.0
        let yIncrement = increment.1
        var coord = Coord(x: 0, y: 0)
        var dict = [String: String]()

        while coord.y < grid.count - 1 {
            coord.x += xIncrement
            coord.y += yIncrement
            if grid[coord.y][coord.x % grid[0].count] == "#" {
                dict[coord.asKey()] = "X"
            } else {
                dict[coord.asKey()] = "O"
            }
        }
        return dict
            .filter { $0.value == "X" }
            .count
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let hej = calculateTrees(input: array, increment: (3,1))
        return String(hej)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result1 = calculateTrees(input: array, increment: (1,1))
        let result2 = calculateTrees(input: array, increment: (3,1))
        let result3 = calculateTrees(input: array, increment: (5,1))
        let result4 = calculateTrees(input: array, increment: (7,1))
        let result5 = calculateTrees(input: array, increment: (1,2))
        let result = result1 * result2 * result3 * result4 * result5
        return String(result)
    }
    
}
