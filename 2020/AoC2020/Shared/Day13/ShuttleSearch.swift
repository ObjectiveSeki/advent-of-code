
import Foundation


struct Bus {
    let ID: Int
    let leaves: Int
}
struct Bus2 {
    let ID: Int
    let ghostBussesBefore: Int
}

class ShuttleSearch: FileReader, Generatable {

    func calculate(_ input: [String]) -> Int {
        let myMinute = Int(input[0])!
        let busIDs = input[1]
            .split(separator: ",")
            .filter { $0 != "x" }
            .map { Int($0)! }

        var bussesLeave = [Bus]()
        for busID in busIDs {
            let leaves = busLeaves(ID: busID, after: myMinute)
            let bus = Bus(ID: busID, leaves: leaves)
            bussesLeave.append(bus)
        }
        bussesLeave.sort {
            $0.leaves < $1.leaves
        }
        let goodBus = bussesLeave.first!
        return (goodBus.leaves - myMinute) * goodBus.ID
    }

    func busLeaves(ID: Int, after minute: Int) -> Int {
        var departMinute = 0
        while departMinute < minute {
            departMinute += ID
        }
        return departMinute
    }


    func calculate2(_ input: [String]) -> Int {
        let busIDs = input[1]
            .split(separator: ",")

        var busses2 = [Bus2]()
        var ghostBusses = 0
        for inp in busIDs {
            if inp == "x" {
                ghostBusses += 1
                continue
            }
            let busID = Int(String(inp))!
            let bus = Bus2(ID: busID, ghostBussesBefore: ghostBusses)
            ghostBusses = 0
            busses2.append(bus)
        }

        var keepLooking = true
        var minute = 0
        var ghostDepartures = 0
        while keepLooking {
            var streak = 1
            for i in 1..<busses2.count {
                let bus = busses2[i]
                ghostDepartures += bus.ghostBussesBefore
                if minute % bus.ID == i + ghostDepartures {
                    streak += 1
                }
                else {
                    ghostDepartures = 0
                    break
                }
            }
            if streak == busses2.count {
                keepLooking = false
                print("hej")
                break
            }
            minute += busses2[0].ID
        }


        return minute
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
