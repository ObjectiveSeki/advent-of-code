
import Foundation


class SleepOverwatch: FileReader, Generatable {

    func generatePartOne(fromFile input: String) -> String {
        let array = orderedArray(fromFile: input)
        for line in array {
            parseLine(line)
        }
        let sleepyGuard = guardWithMostSleep()
        return String(sleepyGuard.minuteSpentMostAsleep * sleepyGuard.ID)
    }

    func generatePartTwo(fromFile input: String) -> String {
        let sleepyGuard = guardMostFrequentSleeperOnAnyMinute()
        return String(sleepyGuard.minuteSpentMostAsleep * sleepyGuard.ID)
    }


    var guards: [Guard] = []
    var currentGuard: Guard!
    var currentMinute = 0


    // MARK: Parsing

    func parseLine(_ string: String) {
        if string.contains("Guard") {
            addGuard(from: string)
        } else if string.contains("falls") {
            logFallsAsleep(from: string)
        } else if string.contains("wakes") {
            logWakesUp(from: string)
        }
    }


    // MARK: Log guard sleep activity

    func addGuard(from string: String) {
        let ID = Int(string.regexIntMatches()[5])
        if let g = guards.first(where: { $0.ID == ID }) {
            currentGuard = g
            currentGuard.currentDay += 1
        } else {
            guards.append(Guard(ID: ID))
            currentGuard = guards.last!
        }
        currentGuard.startNewShift()
    }

    private func logFallsAsleep(from string: String) {
        let minute = Int(string.regexIntMatches()[4])
        currentMinute = minute
    }

    private func logWakesUp(from string: String) {
        let minute = Int(string.regexIntMatches()[4])
        for i in currentMinute..<minute {
            currentGuard.loggedSleepPerShift[currentGuard.currentDay][i] = "#"
        }
    }


    // MARK: Order

    func orderedArray(fromFile file: String) -> [String] {
        let array = stringArray(fromFile: file)
        return array.sorted(by: { (s1, s2) -> Bool in
            let a1 = s1.regexIntMatches()
            let a2 = s2.regexIntMatches()
            if a1[1] != a2[1] { return a1[1] < a2[1] }
            if a1[2] != a2[2] { return a1[2] < a2[2] }
            return a1[4] < a2[4]
        })
    }


    // MARK: Calculating
    
    func guardWithMostSleep() -> Guard {
        var sleepCount = 0
        var mostSleepyGuard: Guard!
        for g in guards {
            let count = g.totalMinutesSlept
            if count > sleepCount {
                sleepCount = count
                mostSleepyGuard = g
            }
        }
        return mostSleepyGuard
    }

    func guardMostFrequentSleeperOnAnyMinute() -> Guard {
        let gs = guards.sorted { (g1, g2) -> Bool in
            return g1.numberOfMinuteSpentMostAsleep > g2.numberOfMinuteSpentMostAsleep
        }
        return gs.first!
    }

}
