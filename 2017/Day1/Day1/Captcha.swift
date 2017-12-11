
import Foundation


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

struct Captcha {
    let sequence: [Int]
    func sum() -> Int {
        var array: [Int] = []
        for i in 0..<sequence.count {
            let next = (i + 1) % (sequence.count)
            if sequence[i] != sequence[next] {
                continue
            }
            array.append(sequence[i])
        }
        return array.reduce(0, +)
    }
}

struct IntArrayMaker: FileReader {
    func giveMeArray(fromFile name: String) -> [Int] {
        let s = string(fromFile: name)!
        return s.flatMap { Int(String($0)) }
    }
}
