
import Foundation


struct Letter {
    let character: Character
    var count: Int
    init(character: Character, count: Int = 1) {
        self.character = character
        self.count = count
    }
}

struct Letters {
    var list: [Letter]
    init(encryptedRoom: String) {
        var tmpList: [Letter] = []
        for char in encryptedRoom.characters {
            if char == "-" { continue }
            if let _ = Int(String(char)) { break }
            
            let index = tmpList.index(where: { (letter) -> Bool in
                letter.character == char
            })
            if let i = index {
                tmpList[i].count += 1
            }
            else {
                tmpList.append(Letter(character: char))
            }
        }
        list = tmpList
    }
    func sortedLetters(_ count: Int) -> [Letter] {
        let sorted = list.sorted {
            if ($0.count == $1.count) {
                return $0.character < $1.character
            }
            return $0.count > $1.count
        }
        return Array(sorted.prefix(count))
    }
}

struct SectorID {
    let number: Int
    init(encryptedRoom: String) {
        let components1 = encryptedRoom.components(separatedBy: "-")
        let last = components1.last!
        let components2 = last.components(separatedBy: "[")
        number = Int(components2.first!)!
    }
}

struct EncryptedName {
    let string: String
    init(encryptedRoom: String) {
        var tmpName = ""
        for char in encryptedRoom.characters {
            if let _ = Int(String(char)) { break }
            if char == "-" {
                tmpName += " "
                continue
            }
            tmpName += String(char)
        }
        string = String(tmpName.characters.dropLast())
    }
}

