
import Foundation


class SeatingSystem: FileReader, Generatable {

    var waitingArea = [[String]]()

    func calculate(_ input: [String]) -> Int {
        waitingArea = input.map { $0.map { String($0) } }
        var someoneMoved = true

        while someoneMoved {
            someoneMoved = false
            var toSit = [(x: Int, y: Int)]()
            var toLeave = [(x: Int, y: Int)]()

            for i in 0..<waitingArea.count {
                for j in 0..<waitingArea[0].count {
                    if waitingArea[i][j] == "." { continue }
                    if isCrowded(around: (i,j)) {
                        toLeave.append((i,j))
                    }
                    if canSit(at: (i,j)) {
                        toSit.append((i,j))
                    }
                }
            }
            for leave in toLeave {
                waitingArea[leave.x][leave.y] = "L"
            }
            for sit in toSit {
                waitingArea[sit.x][sit.y] = "#"
            }
            if toLeave.count > 0 || toSit.count > 0 {
                someoneMoved = true
            }
        }
        return waitingArea
            .map { $0.filter { $0 == "#" } }
            .flatMap { $0 }
            .count
    }

    func canSit(at point: (x: Int, y: Int)) -> Bool {
        if waitingArea[point.x][point.y] == "#" {
            return false
        }
        var count = 0
        for i in point.x-1...point.x+1 {
            for j in point.y-1...point.y+1 {
                if i < 0 || i >= waitingArea.count {
                    count += 1
                }
                else if j < 0 || j >= waitingArea[0].count {
                    count += 1
                }
                else if i == point.x && j == point.y { continue }
                else if waitingArea[i][j] == "L" || waitingArea[i][j] == "." {
                    count += 1
                }
            }
        }
        return count == 8
    }

    func isCrowded(around point: (x: Int, y: Int)) -> Bool {
        if waitingArea[point.x][point.y] == "L" {
            return false
        }
        var count = 0
        for i in point.x-1...point.x+1 {
            for j in point.y-1...point.y+1 {
                if i < 0 || i >= waitingArea.count { continue }
                if j < 0 || j >= waitingArea[0].count { continue }
                if i == point.x && j == point.y { continue }
                if waitingArea[i][j] == "#" {
                    count += 1
                }
            }
        }
        return count >= 4
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate(array)
        return String(result)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let result = calculate(array)
        return String(result)
    }

}
