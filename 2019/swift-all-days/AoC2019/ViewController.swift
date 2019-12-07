
import UIKit


struct Day {
    let number: Int
    var name: String { return "Day \(number)" }
    var story: String { return "StoryDay\(number)" }
    var file: String { return "InputDay\(number)" }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    var days = [
        Day(number: 1),
        Day(number: 2),
        Day(number: 3),
        Day(number: 4),
        Day(number: 6)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }


    // MARK: UIStoryboardSegue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DayDetails" {
            let vc = segue.destination as! DayViewController
            vc.day = days[sender as! Int]
            switch sender as! Int {
            case 0:
                vc.generator = FuelCounter()
            case 1:
                vc.generator = IntcodeProgram()
            case 2:
                vc.generator = JumbleOfWires()
            case 3:
                vc.generator = OKPassword()
            case 4:
                vc.generator = Day6()
            default:
                vc.generator = FuelCounter()
            }
        }
    }


    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DayDetails", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }


    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell (style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = days[indexPath.row].name
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
}

