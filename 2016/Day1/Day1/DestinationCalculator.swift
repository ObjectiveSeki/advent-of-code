
import Foundation


struct DestinationCalculator {
    
    var pivot: Int
    let direction = [Weather.West, Weather.North, Weather.East, Weather.South]
    var grid = Grid()
    
    init(pivot: Int = 1) {
        self.pivot = pivot
    }
    
    mutating func command(c: String) {
        
        let array = c.components(separatedBy: ", ")
        
        for c in array {
            let command = Command(c: c)
            switch command.turn {
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
            
            let d = direction[pivot]
            grid.move(in: d, value: command.blocks)
            
        }
        
    }
    
}
