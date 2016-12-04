
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rooms = RoomFileReader().rooms(fromFile: "RoomData")
        let hq = EasterBunnyHQ(rooms: rooms)
        dump(hq.sumOfSectorIDsFromRealRooms())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
