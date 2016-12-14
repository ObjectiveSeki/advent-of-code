
import Foundation


struct ScreenFeeder {
    
    var screen: Screen
    
    mutating func execute(_ commands: [Command]) {
        for command in commands {
            switch command.type {
            case .rect:
                let rect = Rect(x: command.x, y: command.y)
                screen.light(with: rect)
            case .row:
                screen.rotateRow(command.x, by: command.y)
            case .column:
                screen.rotateColumn(command.x, by: command.y)
                
            }
        }
    }
    
    func lookAtScreen() {
        print("- - - - -")
        for hej in screen.display {
            print(hej)
        }
    }
    
    func countPixelsLit() -> Int {
        var count = 0
        for i in 0..<screen.height() {
            for j in 0..<screen.width() {
                if screen.display[i][j] == "#" {
                    count += 1
                }
            }
        }
        return count
    }
    
}
