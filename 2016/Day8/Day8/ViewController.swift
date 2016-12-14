
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen = Screen(rect: Rect(x: 50, y: 6))
        var screenFeeder = ScreenFeeder(screen: screen)
        let commands = InstructionsFileReader().commands(from: "Data")!
        screenFeeder.execute(commands)
        
        screenFeeder.lookAtScreen()
        print(screenFeeder.countPixelsLit())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
