
import Foundation


enum Point: String {
    case wireOne
    case wireTwo
    case intersect
}

enum Direction: String {
    case R
    case L
    case U
    case D
}

struct Step {
    let direction: Direction
    let length: Int
    init(step: String) {
        let index0 = step.index(step.startIndex, offsetBy: 0)
        let index1 = step.index(step.startIndex, offsetBy: 1)
        direction = Direction(rawValue: step[index0].description)!
        length = Int(step[index1...].description)!
    }
}

struct Intersection {
    let xy: (Int, Int)
    let steps: Int
}

class JumbleOfWires: FileReader, Generatable {

    var grid = [String : [String : [String : String]]]()
    var inter = [Intersection]()

    func trace(path: [String], for wire: Point) {
        var xy = (0, 0)
        var steps = 0
        for jump in path {
            let s = Step(step: jump)
            for _ in 1...s.length {
                switch s.direction {
                case .R:
                    xy.0 += 1
                case .L:
                    xy.0 -= 1
                case .U:
                    xy.1 += 1
                case .D:
                    xy.1 -= 1
                }
                steps += 1
                griddy(xy: xy, for: wire, steps: steps)
            }
        }
    }

    private func griddy(xy: (Int, Int), for wire: Point, steps: Int) {
        if let x = grid[String(xy.0)] {
            if var y = x[String(xy.1)] {
                y[wire.rawValue] = String(steps)
                if
                    let _ = y[Point.wireOne.rawValue],
                    let _ = y[Point.wireTwo.rawValue] {
                    y[Point.intersect.rawValue] = Point.intersect.rawValue
                }
                grid[String(xy.0)]![String(xy.1)] = y
            } else {
                grid[String(xy.0)]![String(xy.1)] = [wire.rawValue: String(steps)]
            }
        } else {
            grid[String(xy.0)] = [String(xy.1) : [wire.rawValue: String(steps)]]
        }
    }

    func distance() -> Int {
        var array = [(Int, Int)]()
        for x in grid.keys {
            for y in grid[x]!.keys {
                if let _ = grid[x]![y]![Point.intersect.rawValue] {
                    array.append((Int(x)!, Int(y)!))
                }
            }
        }
        array.sort { (a, b) -> Bool in
            return (abs(a.0) + abs(a.1)) < (abs(b.0) + abs(b.1))
        }
        return abs(array.first!.0) + abs(array.first!.1)
    }

    func steps() -> Int {
        var fewestSteps = Int.max
        for x in grid.keys {
            for y in grid[x]!.keys {
                if let _ = grid[x]![y]![Point.intersect.rawValue] {
                    let a = Int(grid[x]![y]![Point.wireOne.rawValue]!)!
                    let b = Int(grid[x]![y]![Point.wireTwo.rawValue]!)!
                    if a + b < fewestSteps {
                        fewestSteps = a + b
                    }
                }
            }
        }
        return fewestSteps
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringMatrixNewLineAndComma(fromFile: input)
        trace(path: array[0], for: .wireOne)
        trace(path: array[1], for: .wireTwo)
        return String(distance())
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringMatrixNewLineAndComma(fromFile: input)
        trace(path: array[0], for: .wireOne)
        trace(path: array[1], for: .wireTwo)
        return String(steps())
    }

}
