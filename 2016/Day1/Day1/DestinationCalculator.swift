
import Foundation


struct DestinationCalculator {
    
    var grid = Grid()
    let directions = [Weather.West, Weather.North, Weather.East, Weather.South]
    var pivot: Int = 1
    
    mutating func navigate(with moves: Moves) {
        for move in moves.list {
            updatePivot(basedOn: move)
            let direction = directions[pivot]
            grid.move(in: direction, value: move.blocks)
        }
    }
    
    mutating func updatePivot(basedOn move: Move) {
        switch move.turn {
        case .Right:
            pivot += 1
        case .Left:
            pivot -= 1
        }
        switch pivot {
        case -1:
            pivot = 3
        case 4:
            pivot = 0
        default:
            break
        }
    }
    
}
