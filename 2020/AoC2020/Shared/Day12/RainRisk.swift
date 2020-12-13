
import Foundation


class RainRisk: FileReader, Generatable {

    func calculate1(_ input: [String]) -> Int {
        var ship = Ship()
        for instruction in input {
            ship.instruction(instruction)
        }
        return ship.manhattanDistance
    }

    func calculate2(_ input: [String]) -> Int {
        var ship = Ship()
        for instruction in input {
            ship.instruction(instruction)
        }
        return ship.manhattanDistance
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate1(array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate1(array)
        return String(result)
    }
}

enum NavInstruction: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"

    case forward = "F"

    case left = "L"
    case right = "R"
}

struct Ship {
    var southNorth = 0
    var westEast = 0
    var facing = NavInstruction.east

    var manhattanDistance: Int {
        return abs(southNorth) + abs(westEast)
    }

    mutating func instruction(_ string: String) -> Void {
        let array = string.map { String($0) }
        let instruction = NavInstruction(rawValue: array[0])!
        let value = Int(array[1..<array.count].joined())!

        switch instruction {
        case .left, .right:
            updateFacing(instruction, with: value)
        case .forward:
            updatePosition(facing, with: value)
        case .north, .south, .east, .west:
            updatePosition(instruction, with: value)
        }
    }

    mutating func updateFacing(_ turn: NavInstruction, with value: Int) -> Void {
        let times = Int(value / 90)
        for _ in 0..<times {
            switch turn {
            case .right:
                turnRight()
            case .left:
                turnLeft()
            case .forward, .east, .west, .north, .south:
                break
            }
        }
    }

    mutating func updatePosition(_ streck: NavInstruction, with distance: Int) -> Void {
        switch streck {
        case .north:
            southNorth += distance
        case .south:
            southNorth -= distance
        case .east:
            westEast += distance
        case .west:
            westEast -= distance
        case .forward, .left, .right:
            break
        }
    }

    mutating func turnRight() {
        switch facing {
        case .north:
            facing = .east
        case .east:
            facing = .south
        case .south:
            facing = .west
        case .west:
            facing = .north
        case .forward, .left, .right:
            break
        }
    }

    mutating func turnLeft() {
        switch facing {
        case .north:
            facing = .west
        case .west:
            facing = .south
        case .south:
            facing = .east
        case .east:
            facing = .north
        case .forward, .left, .right:
            break
        }
    }
}
