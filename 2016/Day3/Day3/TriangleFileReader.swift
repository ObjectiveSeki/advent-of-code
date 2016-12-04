
import Foundation


struct TriangleFileReader: FileReader {
    
    func triangles(fromFile name: String) -> [Triangle] {
        guard let s = string(fromFile: name) else { return [] }
        return triangles(from: s)
    }
    
    func triangles(from string: String) -> [Triangle] {
        let components = string.components(separatedBy: "\n")
        var triangles: [Triangle] = []
        for c in components {
            guard let t = triangle(from: c) else { continue }
            triangles.append(t)
        }
        return triangles
    }
    
    func triangle(from string: String) -> Triangle? {
        let components = string.components(separatedBy: " ")
        let filteredComponents = components.filter { $0 != "" }
        if filteredComponents.count != 3 { return nil }
        guard let a = Int(filteredComponents[0]) else { return nil }
        guard let b = Int(filteredComponents[1]) else { return nil }
        guard let c = Int(filteredComponents[2]) else { return nil }
        return Triangle(a: a, b: b, c: c)
    }
    
}
