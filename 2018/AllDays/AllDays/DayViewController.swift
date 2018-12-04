
import UIKit


protocol Generatable {
    func generatePartOne(fromFile input: String) -> String
    func generatePartTwo(fromFile input: String) -> String
}

class DayViewController: UIViewController {

    @IBOutlet weak var answerPart1: UITextField!
    @IBOutlet weak var answerPart2: UITextField!

    var day: Day!
    var generator: Generatable!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = day.name
    }

    @IBAction func generatePart1Tapped(_ sender: Any) {
        let queue = DispatchQueue.init(label: "background", qos: .background)
        queue.async {
            let text = self.generator.generatePartOne(fromFile: self.day.file)
            DispatchQueue.main.async {
                print(text)
                self.answerPart1.text = text
            }
        }
    }

    @IBAction func generatePart2Tapped(_ sender: Any) {
        let queue = DispatchQueue.init(label: "background", qos: .background)
        queue.async {
            let text = self.generator.generatePartTwo(fromFile: self.day.file)
            DispatchQueue.main.async {
                print(text)
                self.answerPart2.text = text
            }
        }
    }

}
