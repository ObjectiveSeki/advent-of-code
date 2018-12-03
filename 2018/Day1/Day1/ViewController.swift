
import UIKit


struct FrequencyCalibrator: FileReader {
    func resultingFrequency(fromFile input: String) -> Int {
        let s = stringArray(fromFile: input).map { Int($0)! }
        return resultingFrequency(from: s)

    }
    func resultingFrequency(from array: [Int]) -> Int {
        var result = 0
        for frequency in array {
            result += frequency
        }
        return result
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func result(_ sender: Any) {
        let fc = FrequencyCalibrator()
        label.text = String(fc.resultingFrequency(fromFile: "Input"))
    }

}

