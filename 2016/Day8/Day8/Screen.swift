
import Foundation


struct Rect {
    let x: Int
    let y: Int
}


struct Screen {
    
    /* Should look something like this:
     var display = [
        [".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."]
     ]
     */
    
    var display: [[String]]
    
    init(rect: Rect) {
        display = [[String]](repeatElement([String](repeatElement(".", count: rect.x)), count: rect.y))
    }
    
    
    func height() -> Int {
        return display.count
    }
    
    func width() -> Int {
        return display[0].count
    }
    
    mutating func light(with rect: Rect) {
        for i in 0..<rect.y {
            for j in 0..<rect.x {
                display[i][j] = "#"
            }
        }
    }
    
    mutating func rotateColumn(_ col: Int, by iteration: Int) {
        for _ in 1...iteration {
            let oldDisplay = display
            for i in 0..<height() {
                display[i][col] = oldDisplay[(i + height()-1) % height()][col]
            }
        }
    }
    
    mutating func rotateRow(_ row: Int, by iteration: Int) {
        for _ in 1...iteration {
            let oldDisplay = display
            for i in 0..<width() {
                display[row][i] = oldDisplay[row][(i + width()-1) % width()]
            }
        }
    }
}
