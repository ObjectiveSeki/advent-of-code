
import Foundation


struct MessageFileReader: FileReader {
    func message(fromFile name: String) -> String {
        guard let s = string(fromFile: name) else { return "" }
        return s
    }
}

struct MessageInterpreter {
    
    var list: [String] = []
    
    init(repeatingMessageSignal: String) {
        let components = repeatingMessageSignal.components(separatedBy: "\n")
        for c in components {
            list.append(c)
        }
    }
    
    func errorCorrectedMessage() -> String {
        var message = ""
        let length = Int(list.first!.characters.count - 1)
        for i in 0...length {
            let noise = noisyLetters(atColumn: i)
            let letters = Letters(noisyLetters: noise)
            if let letter = letters.mostCommon()?.character.description {
                message += letter
            }
        }
        return message
    }
    
    func realErrorCorrectedMessage() -> String {
        var message = ""
        let length = Int(list.first!.characters.count - 1)
        for i in 0...length {
            let noise = noisyLetters(atColumn: i)
            let letters = Letters(noisyLetters: noise)
            if let letter = letters.leastCommon()?.character.description {
                message += letter
            }
        }
        return message
    }
    
    private func noisyLetters(atColumn column: Int) -> String {
        var noisyLetters = ""
        for message in list {
            noisyLetters.append(message.string(at: column))
        }
        return noisyLetters
    }
    
}
