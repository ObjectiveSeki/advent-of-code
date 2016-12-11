
import Foundation


struct IPAddressFileReader: FileReader {
    
    func IPAddresses(fromFile name: String) -> [IPAddress] {
        guard let s = string(fromFile: name) else { return [] }
        return IPAddresses(from: s)
    }
    
    func IPAddresses(from string: String) -> [IPAddress] {
        let components = string.components(separatedBy: "\n")
        var rooms: [IPAddress] = []
        for c in components {
            let add = IPAddress(address: c)
            rooms.append(add)
        }
        return rooms
    }
    
}
