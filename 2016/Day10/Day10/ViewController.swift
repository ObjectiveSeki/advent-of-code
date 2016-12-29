
import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reader = BotsFileReader()
        let bots = reader.readBots(from: "Data")!
        let instructions = reader.readInstructions(from: "Data")!
        
        var sut = Factory(bots: bots)
        sut.respValues = [Microchip(value: 17), Microchip(value: 61)]
        sut.zooming(with: instructions)
        dump(sut.responsibleBot)
        
        let sorted = sut.bins.sorted(by: { $0.number < $1.number})
        dump((sorted[0].microships.first?.value)! * (sorted[1].microships.first?.value)! * (sorted[2].microships.first?.value)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
