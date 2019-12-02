
import Foundation


protocol FileReader { }

extension FileReader {

    func stringArrayComma(fromFile name: String) -> [String] {
        guard let s = string(fromFile: name) else { return [] }
        return s.components(separatedBy: ",")
    }

    func stringArrayNewLine(fromFile name: String) -> [String] {
        guard let s = string(fromFile: name) else { return [] }
        return s.components(separatedBy: .newlines)
    }

    func string(fromFile name: String) -> String? {
        let url = bundleURL(from: name)
        let s = try! String(contentsOf: url)
        return s.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func bundleURL(from name: String) -> URL {
        let file = Bundle.main.path(forResource: name, ofType: nil)!
        return URL(fileURLWithPath: file)
    }

}
