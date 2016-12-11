
import Foundation


struct PasswordCracker {
    
    let input: String
    
    func execute() -> String {
        var password = ""
        var indexN = 0
        for _ in 1...8 {
            let x = interestingHash(indexN+1)
            indexN = x.0
            let hex = x.1
            let start = hex.index(hex.startIndex, offsetBy: 5)
            let end = hex.index(hex.startIndex, offsetBy: 6)
            let range: Range = start..<end
            password += hex.substring(with: range)
            dump(password)
        }
        return password
    }
    
    func executeReal() -> String {
        var password = "________"
        var nextIndex = 0
        while true {
            let x = interestingHash(nextIndex)
            let hex = x.1
            nextIndex = x.0 + 1
            
            let start = hex.index(hex.startIndex, offsetBy: 5)
            let end = hex.index(hex.startIndex, offsetBy: 6)
            let range: Range = start..<end
            let letter5 = hex.substring(with: range)
            
            if Int(letter5) == nil {
                continue
            }
            if Int(letter5)! >= password.characters.count{
                continue
            }
            
            let start2 = hex.index(hex.startIndex, offsetBy: 6)
            let end2 = hex.index(hex.startIndex, offsetBy: 7)
            let range2: Range = start2..<end2
            let letter6 = hex.substring(with: range2)
            
            let start3 = password.index(password.startIndex, offsetBy: Int(letter5)!)
            let end3 = password.index(password.startIndex, offsetBy: Int(letter5)! + 1)
            let range3: Range = start3..<end3
            
            if password.substring(with: range3) != "_" {
                continue
            }
            password = password.replacingCharacters(in: range3, with: letter6)
            
            let dashes = password.characters.filter({ (char) -> Bool in
                return char.description == "_"
            })
            dump(password)
            dump(dashes)
            if dashes.count == 0 {
                return password
            }
        }
    }
    
    func interestingHash(_ i: Int) -> (Int, String) {
        var indexNumber = i
        let start = Date()
        while (true) {
            let hex = (input + String(indexNumber)).md5()!
            let index = hex.index(hex.startIndex, offsetBy: 5)
            let firstFive = hex.substring(to: index)
            let zeros = firstFive.characters.filter({ (char) -> Bool in
                return char.description == "0"
            })
            if zeros.count == 5 {
                print(Date().offset(from: start))
                print(start.offset(from: Date()))
                return (indexNumber, hex)
            }
            indexNumber += 1
        }
    }
    
}
