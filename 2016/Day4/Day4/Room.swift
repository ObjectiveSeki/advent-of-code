
import Foundation


struct Room {
    let letters: Letters
    let sectorID: SectorID
    let checksum: String
    init(encryptedRoom: String) {
        letters = Letters(encryptedRoom: encryptedRoom)
        sectorID = SectorID(encryptedRoom: encryptedRoom)
        checksum = encryptedRoom.slice(from: "[", to: "]")!
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
}
