
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let addresses = IPAddressFileReader().IPAddresses(fromFile: "Data")
        let validator = IPAddressValidator(list: addresses)
        print(validator.numberOfValidAddresses())
        print(validator.numberOfSSLAddresses())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
