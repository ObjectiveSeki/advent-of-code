
import Foundation


enum CommandType : String {
    case rect
    case row
    case column
}

struct Command {
    let type: CommandType
    let x: Int
    let y: Int
}

struct InstructionsFileReader: FileReader {
    
    func commands(from file:String) -> [Command]? {
        let pat = "(rect|row|column)\\D+(\\d+)\\D+(\\d+)"
        let matches = string(fromFile: file)?.matchingStrings(regex: pat)
        
        return matches?.map({ (array) -> Command in
            return Command(
                type: CommandType(rawValue: array[1])!,
                x: Int(array[2])!,
                y: Int(array[3])!
            )
        })
    }
    
}
