
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let message = MessageFileReader().message(fromFile: "Data")
        let mi = MessageInterpreter(repeatingMessageSignal: message)
        dump(mi.errorCorrectedMessage())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
