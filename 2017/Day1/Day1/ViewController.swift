
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(_ sender: Any) {
        let array = IntArrayMaker().giveMeArray(fromFile: "Input")
        let captcha = Captcha(sequence: array)
        let sum = captcha.sum()
        print(sum)
        label.text = String(sum)
    }
    
}
