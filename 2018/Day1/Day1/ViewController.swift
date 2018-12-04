
import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Don't forget to run in Release mode!
    // In Debug mode it takes ages!
    @IBAction func result(_ sender: Any) {
        let fc = FrequencyCalibrator()
        label.text = String(fc.resultingFrequency(fromFile: "Input"))
        let queue = DispatchQueue(label: "hejj :)", qos: .background)
        queue.async {
            let result = fc.firstFrequencyReachedTwice(fromFile: "Input")
            DispatchQueue.main.async {
                print("Result: \(result)")
            }
        }
    }

}

