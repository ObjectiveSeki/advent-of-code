
import Foundation


class OrbiterCalculator {

    let dict: [String:String]

    init(orbits: [String]) {
        var dict = [String:String]()
        for s in orbits {
            let comp = s.components(separatedBy: ")")
            dict[comp[1]] = comp[0]
        }
        self.dict = dict
    }

    func orbitCount(from o1: String, to o2: String) -> Int {
        if o1 == o2 {
            return 0
        }
        let d = orbitCountForEachObject(from: o1, to: o2)
        return d[o2]!
    }

    func orbitCountForEachObject(from o1: String, to o2: String) -> [String: Int] {
        var d = [String: Int]()
        var i = 1
        var nextO = o1
        while dict[nextO] != o2 {
            nextO = dict[nextO]!
            d[nextO] = i
            i += 1
        }
        d[o2] = i
        return d
    }

    func orbitCountMeToSanta() -> Int {
        let d1 = orbitCountForEachObject(from: "YOU", to: "COM")
        let d2 = orbitCountForEachObject(from: "SAN", to: "COM")
        let overlapping = Array(Set(d1.keys).intersection(Set(d2.keys)))
        var lowest = ("", Int.max)
        for o in overlapping {
            if d1[o]! < lowest.1 {
                lowest = (o, d1[o]!)
            }
        }

        let myObject = dict["YOU"]!
        let santasObject = dict["SAN"]!
        let x = orbitCount(from: myObject, to: lowest.0)
        let y = orbitCount(from: santasObject, to: lowest.0)
        return x + y
    }

    func totalOrbitCount() -> Int {
        let keys = dict.keys.sorted()
        var i = 0
        for key in keys {
            i += orbitCount(from: key, to: "COM")
        }
        return i
    }

}

struct Day6: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let o = OrbiterCalculator(orbits: array)
        return String(o.totalOrbitCount())
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input)
        let o = OrbiterCalculator(orbits: array)
        return String(o.orbitCountMeToSanta())
    }

}
