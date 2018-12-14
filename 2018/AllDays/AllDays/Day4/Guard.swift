
import Foundation


class Guard {
    
    let ID: Int
    var currentDay = 0

    var loggedSleepPerShift = [[String]]()
    var getLoggedSleep: [String] {
        return loggedSleepPerShift.map { $0.joined() }
    }

    init(ID: Int) {
        self.ID = ID
    }

    func startNewShift() {
        let oneAwakeHour = "............................................................"
        let array = oneAwakeHour.map { $0.description }
        self.loggedSleepPerShift.append(array)
    }


    // Mark: Calculation

    var totalMinutesSlept: Int {
        var count = 0
        for day in getLoggedSleep {
            let sleepMinutes = day.filter { $0 == "#" }.count
            count += sleepMinutes
        }
        return count
    }
    
    var minuteSpentMostAsleep: Int {
        var sleepyMinute = -1
        var mostSleptMinutes = 0
        for i in 0..<60 {
            var sleptMinutes = 0
            for shift in loggedSleepPerShift {
                if shift[i] == "#" {
                    sleptMinutes += 1
                }
            }
            if sleptMinutes >= mostSleptMinutes {
                mostSleptMinutes = sleptMinutes
                sleepyMinute = i
            }
        }
        return sleepyMinute
    }

}
