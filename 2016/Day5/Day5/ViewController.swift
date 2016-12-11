
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cracker = PasswordCracker(input: "cxdnnyjw")
        print(cracker.executeReal())
//        print(cracker.execute())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
