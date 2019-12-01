
import UIKit


protocol FileReader { }

extension FileReader {
    func string(fromFile name: String) -> String? {
        let url = bundleURL(from: name)
        let s = try? String(contentsOf: url)
        return s?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    private func bundleURL(from name: String) -> URL {
        let file = Bundle.main.path(forResource: name, ofType: nil)
        return URL(fileURLWithPath: file!)
    }
}


struct IntMatrixMaker: FileReader {
    func giveMeMatrix(fromFile name: String) -> [[Int]] {
        let s = string(fromFile: name)!
        let sArray = splitOnNewLine(s)
        var matrix = [[Int]]()
        for ss in sArray {
            matrix.append(giveMeArray(fromString: ss))
        }
        return matrix
    }
    func giveMeArray(fromString s: String) -> [Int] {
        let array = s.components(separatedBy: " ").filter { $0 != ""}
        return array.map { Int($0)! }
    }
    
    func splitOnNewLine(_ s: String) -> [String] {
        return s.components(separatedBy: .newlines)
    }
}

struct Spreadsheet {
    let matrix: [[Int]]
    func checksum() -> Int {
        var sum = 0
        for array in matrix {
            sum += checksum(for: array)
        }
        return sum
    }
    func checksum(for array: [Int]) -> Int {
        var biggest = 0
        var smallest = Int.max
        for i in array {
            if i == 0 { continue }
            if i > biggest {
                biggest = i
            }
            if i < smallest {
                smallest = i
            }
        }
        return biggest - smallest
    }
}

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

    @IBAction func checksumAction(_ sender: Any) {
        let matrix = IntMatrixMaker().giveMeMatrix(fromFile: "Input")
        print(matrix)
        let sheet = Spreadsheet(matrix: matrix)
        print(sheet.checksum())
        label.text = String(sheet.checksum())
    }
    
}

