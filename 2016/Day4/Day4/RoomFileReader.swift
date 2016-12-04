
import Foundation


struct RoomFileReader: FileReader {
    
    func rooms(fromFile name: String) -> [Room] {
        guard let s = string(fromFile: name) else { return [] }
        return rooms(from: s)
    }
    
    func rooms(from string: String) -> [Room] {
        let components = string.components(separatedBy: "\n")
        var rooms: [Room] = []
        for c in components {
            let r = Room(encryptedRoom: c)
            rooms.append(r)
        }
        return rooms
    }
    
}
