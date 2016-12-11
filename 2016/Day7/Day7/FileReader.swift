
import Foundation


protocol FileReader {
    func string(fromFile name: String) -> String?
    func fileData(from url: URL) -> Data
}

extension FileReader {
    
    internal func string(fromFile name: String) -> String? {
        let url = bundleURL(from: name)
        return try? String(contentsOf: url)
    }
    
    internal func fileData(from url: URL) -> Data {
        var data = Data()
        do {
            data = try Data(contentsOf: url)
        } catch let error as NSError {
            dump(error.localizedDescription)
        }
        return data
    }
    
    internal func bundleURL(from name: String) -> URL {
        let file = Bundle.main.path(forResource: name, ofType: nil)
        return URL(fileURLWithPath: file!)
    }
    
}
