
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rooms = RoomFileReader().rooms(fromFile: "RoomData")
        let hq = EasterBunnyHQ(rooms: rooms)
        dump(hq.sumOfSectorIDsFromRealRooms())
        
        let room = hq.rooms.filter { (room) -> Bool in
            return room.realName().contains("north")
        }.first!
        print(room.realName())
        print(room.sectorID.number)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
