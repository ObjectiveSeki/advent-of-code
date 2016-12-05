
import Foundation


struct Room {
    let encryptedName: EncryptedName
    let letters: Letters
    let sectorID: SectorID
    let checksum: String
    init(encryptedRoom: String) {
        encryptedName = EncryptedName(encryptedRoom: encryptedRoom)
        letters = Letters(encryptedRoom: encryptedRoom)
        sectorID = SectorID(encryptedRoom: encryptedRoom)
        if let slice = encryptedRoom.slice(from: "[", to: "]") {
            checksum = slice
        }
        else {
            checksum = ""
        }
    }
    
    func isReal() -> Bool {
        var foundCount = 0
        let sortedLetters = letters.sortedLetters(checksum.characters.count)
        for char in checksum.characters {
            let found = sortedLetters.filter({ $0.character == char })
            if found.count == 1 {
                foundCount += 1
            }
        }
        if foundCount == checksum.characters.count {
            return true
        }
        else {
            return false
        }
    }
    
    func realName() -> String {
        var tmpString = ""
        for s in encryptedName.string.characters {
            if s == " " {
                tmpString.append(s)
                continue
            }
            let unicode = s.unicodeScalarCodePoint()
            let x = (Int(unicode) - 97 + sectorID.number) % 26
            let newUnicode = x + 97
            tmpString += UnicodeScalar(newUnicode)!.description
        }
        return tmpString
    }
}
