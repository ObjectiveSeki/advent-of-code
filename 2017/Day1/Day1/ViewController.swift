
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var labelNext: UILabel!
    @IBOutlet weak var labelHalfway: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func next(_ sender: Any) {
        let array = IntArrayMaker().giveMeArray(fromFile: "Input")
        let captcha = Captcha(sequence: array)
        let sum = captcha.sumNext()
        print(sum)
        labelNext.text = String(sum)
    }
    
    @IBAction func halfwayAround(_ sender: Any) {
        let array = IntArrayMaker().giveMeArray(fromFile: "Input")
        let captcha = Captcha(sequence: array)
        let sum = captcha.sumHalfwayAround()
        print(sum)
        labelHalfway.text = String(sum)
    }
}
