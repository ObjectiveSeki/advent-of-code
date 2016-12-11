
import Foundation


struct AddressRange {
    
    let string: String
    let isBracket: Bool
    
    init(string: String, isBracket: Bool = false) {
        self.string = string
        self.isBracket = isBracket
    }
    
    func isValid() -> Bool {
        for i in 0...string.characters.count - 4 {
            let index0 = string.string(at: i + 0)
            let index1 = string.string(at: i + 1)
            let index2 = string.string(at: i + 2)
            let index3 = string.string(at: i + 3)
            if index0 == index3 && index1 == index2 {
                if index0 != index1 {
                    return true
                }
            }
        }
        return false
    }
    
    func aba() -> [String] {
        var strings: [String] = []
        for i in 0...string.characters.count - 3 {
            let index0 = string.string(at: i + 0)
            let index1 = string.string(at: i + 1)
            let index2 = string.string(at: i + 2)
            if index0 == index1 { continue }
            if index0 == index2 {
                strings.append("".appending(index0).appending(index1).appending(index2))
//                return "".appending(index0).appending(index1).appending(index2)
            }
        }
        return strings
    }
    
    func bab(from aba: String) -> Bool {
        let indexAba0 = aba.string(at: 0)
        let indexAba1 = aba.string(at: 1)
//        let indexAba2 = aba.string(at: 2)
        for i in 0...string.characters.count - 3 {
            let indexBab0 = string.string(at: i + 0)
            let indexBab1 = string.string(at: i + 1)
            let indexBab2 = string.string(at: i + 2)
            if indexAba0 == indexBab1 && indexAba1 == indexBab0 && indexAba1 == indexBab2 {
                return true
            }
        }
        return false
    }
}

struct IPAddress {
    
    let addressComponents: [AddressRange]
    
    init(address: String) {
        var tmpAddress: [AddressRange] = []
        let components = address.components(separatedBy: "[")
        for c in components {
            let components2 = c.components(separatedBy: "]")
            if components2.count == 2 {
                tmpAddress.append(AddressRange(string: components2.first!, isBracket: true))
                tmpAddress.append(AddressRange(string: components2.last!))
            }
            else {
                tmpAddress.append(AddressRange(string: components2.first!))
            }
        }
        self.addressComponents = tmpAddress
    }
    
    func supportsTLS() -> Bool {
        var found = false
        for address in addressComponents {
            if address.isValid() {
                if address.isBracket {
                    return false
                }
                found = true
            }
        }
        return found
    }
    
    func supportsSSL() -> Bool {
        let supernet =  addressComponents.filter { (range) -> Bool in
            return range.isBracket == false
        }
        let hypernet  =  addressComponents.filter { (range) -> Bool in
            return range.isBracket == true
        }
        for range in supernet {
            let abas = range.aba()
            for aba in abas {
                for range2 in hypernet {
                    if range2.bab(from: aba) == true {
                        return true
                    }
                }
            }
        }
        return false
    }
    
}
