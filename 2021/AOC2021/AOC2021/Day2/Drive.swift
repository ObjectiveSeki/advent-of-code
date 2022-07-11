
import Foundation

enum Direction: String {
    case forward
    case down
    case up
}

struct Command {
    let direction: Direction
    let units: Int
}

struct Drive: FileReader {

    var instructions: [Command]? = nil

    init(inputFile: String? = nil) {
        guard let file = inputFile else { return }
        makeInstructions(stringArrayNewLine(fromFile: file))
    }

    mutating func makeInstructions(_ list: [String]) {
        instructions = list.map {
            return Command(
                direction: Direction(rawValue: $0.components(separatedBy: " ").first!)!,
                units: Int($0.components(separatedBy: " ").last!)!
            )
        }
    }

    func followInstructions(_ list: [Command]) -> Int {
        var horizontal = 0, depth = 0
        for command in list {
            switch command.direction {
            case .forward:
                horizontal += command.units
            case .down:
                depth += command.units
            case .up:
                depth -= command.units
            }
        }
        return horizontal * depth
    }

    func followInstructionsWithAim(_ list: [Command]) -> Int {
        var horizontal = 0, depth = 0, aim = 0
        for command in list {
            switch command.direction {
            case .forward:
                horizontal += command.units
                depth += aim * command.units
            case .down:
                aim += command.units
            case .up:
                aim -= command.units
            }
        }
        return horizontal * depth
    }

    func generatePartOne() -> String {
        guard let instructions = instructions else { return "" }
        let result = followInstructions(instructions)
        return String(result)
    }

    func generatePartTwo() -> String {
        guard let instructions = instructions else { return "" }
        let result = followInstructionsWithAim(instructions)
        return String(result)
    }

}
