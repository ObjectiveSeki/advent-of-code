
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let triangles = TriangleFileReader().triangles(fromFile: "TrianglesData")
        let keeper = TriangleKeeper(triangles: triangles)
        dump(keeper.triangles.count)
        dump(keeper.totalPossibleTriangles())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

