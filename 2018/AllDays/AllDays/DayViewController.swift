
import UIKit


protocol Generatable {
    func generatePartOne() -> String
    func generatePartTwo() -> String
}

struct GenTest: Generatable {
    func generatePartOne() -> String {
        return "Yohh"
    }

    func generatePartTwo() -> String {
        return ":)))))"
    }


}

class DayViewController: UIViewController {

    @IBOutlet weak var answerPart1: UITextField!
    @IBOutlet weak var answerPart2: UITextField!

    var day: Day!
    var generator: Generatable! = GenTest()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = day.name
    }

    @IBAction func generatePart1Tapped(_ sender: Any) {
        answerPart1.text = generator.generatePartOne()
    }

    @IBAction func generatePart2Tapped(_ sender: Any) {
        answerPart2.text = generator.generatePartTwo()
    }

}
