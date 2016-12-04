
import Foundation


struct TriangleKeeper {
    
    let triangles: [Triangle]
    
    func totalPossibleTriangles() -> Int {
        let valid = triangles.filter { $0.isValid == true }
        return valid.count
    }
}
