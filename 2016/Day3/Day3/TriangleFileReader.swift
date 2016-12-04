
import Foundation


struct TriangleFileReader: FileReader {
    
    func realTriangles(fromFile name: String) -> [Triangle] {
        guard let s = string(fromFile: name) else { return [] }
        let oldTriangles = triangles(from: s)
        var newTriangles: [Triangle] = []
        var x = 0
        while x < oldTriangles.count {
            let old1 = oldTriangles[x+0]
            let old2 = oldTriangles[x+1]
            let old3 = oldTriangles[x+2]
            newTriangles.append(Triangle(a: old1.a, b: old2.a, c: old3.a))
            newTriangles.append(Triangle(a: old1.b, b: old2.b, c: old3.b))
            newTriangles.append(Triangle(a: old1.c, b: old2.c, c: old3.c))
            x += 3
        }
        return newTriangles
    }
    
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
