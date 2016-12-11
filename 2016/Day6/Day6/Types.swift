
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
    init(noisyLetters: String) {
        var tmpList: [Letter] = []
        for char in noisyLetters.characters {
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
    func mostCommon() -> Letter? {
        let sorted = list.sorted {
            if ($0.count == $1.count) {
                return $0.character < $1.character
            }
            return $0.count > $1.count
        }
        return sorted.first
    }
}
