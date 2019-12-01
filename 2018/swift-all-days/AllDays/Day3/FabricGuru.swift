import Foundation


struct Rectangle: Equatable {
    let ID: Int
    let position: (x: Int, y: Int)
    let size: (x: Int, y: Int)
    var claimed: Bool

    static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.ID == rhs.ID
            && lhs.position == rhs.position
            && lhs.size == rhs.size
    }
}

class FabricGuru: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArray(fromFile: input)
        for a in array {
            plot(makeRectangle(from: a))
        }
        return String(overlappingSquareInches())
    }

    func generatePartTwo(fromFile input: String) -> String {
        return String(claimNotOverlapping())
    }


    var rectangles = [Rectangle]()
    var matrix = [[String]]()

    init(size: (x: Int, y: Int)) {
        var arr = [String]()
        for _ in 0..<size.x {
            arr.append(".")
        }
        for _ in 0..<size.y {
            matrix.append(arr)
        }
    }

    func makeRectangle(from string: String) -> Rectangle {
        let ID = Int(string
            .split(separator: "@")
            .first!.dropFirst()
            .dropLast().description
        )!
        let values = string
            .split(separator: "@")
            .last?
            .split(separator: ":")
            .map { $0.description.dropFirst().description }

        let position = values![0].split(separator: ",").map { Int($0)! }
        let size = values![1].split(separator: "x").map { Int($0)! }
        let rectangle = Rectangle(
            ID: ID,
            position: (position[0], position[1]),
            size: (size[0], size[1]),
            claimed: false
        )
        rectangles.append(rectangle) // TD: Make this better
        return rectangle
    }

    func plot(_ rectangle: Rectangle) {
        var coordinates = [[Int]]()
        for i in 0..<rectangle.size.y {
            for j in 0..<rectangle.size.x {
                coordinates.append([rectangle.position.y + i, rectangle.position.x + j])
            }
        }
        for coor in coordinates {
            if matrix[coor[0]][coor[1]] == "." {
                matrix[coor[0]][coor[1]] = String(rectangle.ID)
            } else {
                isClaimed(ID: matrix[coor[0]][coor[1]])
                isClaimed(ID: String(rectangle.ID))
                matrix[coor[0]][coor[1]] = "X"
            }
        }
    }

    func overlappingSquareInches() -> Int {
        var count = 0
        for array in matrix {
            count += array.filter { $0 == "X" }.count
        }
        return count
    }

    private func isClaimed(ID: String) {
        if ID == "X" { return }
        let index = rectangles.firstIndex { $0.ID == Int(ID) }!
        rectangles[index].claimed = true
    }

    func claimNotOverlapping() -> Int {
        let hej = rectangles.filter { $0.claimed == false }
        return hej.first!.ID
    }
}
