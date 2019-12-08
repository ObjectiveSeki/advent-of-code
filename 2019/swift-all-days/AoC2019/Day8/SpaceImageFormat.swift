
import Foundation


struct SpaceImageFormat {

    let data: String
    let wide: Int
    let tall: Int

    func createImage() -> [[[Int]]] {
        var image = [[[Int]]]()
        var layer = [[Int]]()
        var line = [Int]()
        var i = 0
        var j = 0
        for char in data {
            line.append(char.wholeNumberValue!)
            i += 1
            if i % (wide) == 0 {
                layer.append(line)
                j += 1
                line = []
                if j % tall == 0 {
                    image.append(layer)
                    layer = []
                }
            }
        }
        return image
    }

    func layerFewestZero() -> [[Int]] {
        let image = createImage()
        var fewest = (0, Int.max)
        for i in 0..<image.count {
            let layer = image[i]
            let zeros = layer
                .flatMap { $0 }
                .filter { $0 == 0 }
                .count
            if zeros < fewest.1 {
                fewest = (i, zeros)
            }
        }
        return image[fewest.0]
    }

    func multiTest(for layer: [[Int]], x: Int, y: Int) -> Int {
        let a = number(of: x, in: layer)
        let b = number(of: y, in: layer)
        return a * b
    }

    func finalImage() -> [[Int]] {
        let image = createImage()
        var finalImage = Array(
            repeating: Array(
                repeating: 0,
                count: wide
            ),
            count: tall
        )
        for j in 0..<wide {
            for i in 0..<tall {
                var nonTransparent = -1
                for layer in image {
                    if layer[i][j] != 2 {
                        nonTransparent = layer[i][j]
                        break
                    }
                }
                finalImage[i][j] = nonTransparent
            }
        }
        return finalImage
    }

    func produceMessage() -> [String ]{
        return finalImage()
            .map {
                $0.map { String($0) }
                    .joined()
                    .replacingOccurrences(of: "0", with: " ")
                    .replacingOccurrences(of: "1", with: "X")
            }
    }

    private func number(of number: Int, in layer: [[Int]]) -> Int {
        return layer
            .flatMap { $0 }
            .filter { $0 == number }
            .count
    }

}

struct Day8: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let s = string(fromFile: input)!
        let format = SpaceImageFormat(data: s, wide: 25, tall: 6)
        let fewest = format.layerFewestZero()
        return String(format.multiTest(for: fewest, x: 1, y: 2))
    }

    func generatePartTwo(fromFile input: String) -> String {
        let s = string(fromFile: input)!
        let format = SpaceImageFormat(data: s, wide: 25, tall: 6)
        var result = ""
        for line in format.produceMessage() {
            result.append(line + "\n")
        }
        return result
    }

}
