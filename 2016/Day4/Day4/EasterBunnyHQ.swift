
import Foundation


struct EasterBunnyHQ {
    
    let rooms: [Room]
    
    func sumOfSectorIDsFromRealRooms() -> Int {
        var sum = 0
        for room in rooms {
            if room.isReal() {
                sum += room.sectorID.number
            }
        }
        return sum
    }
}
