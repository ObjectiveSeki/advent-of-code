
import XCTest
@testable import AllDays


class Day4Tests: XCTestCase, FileReader {

    var sut: SleepOverwatch!

    override func setUp() {
        sut = SleepOverwatch()
    }

    func testGuardID() {
        let string = "[1518-11-01 00:00] Guard #10 begins shift"
        sut.parseLine(string)
        XCTAssertEqual(sut.currentGuard.ID, 10)
    }

    func testSortedInputByDateAndTime() {
        let ordered = stringArray(fromFile: "InputDay4TestOrdered")
        let result = sut.orderedArray(fromFile: "InputDay4TestDisordered")
        XCTAssertEqual(result, ordered)
    }

    func testX() {
        let input = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
        ]
        for line in input {
            sut.parseLine(line)
        }
        XCTAssertEqual(sut.currentGuard.ID, 10)
    }

    func testY() {
        let input = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            ]
        for line in input {
            sut.parseLine(line)
        }

        let hej = ".....####################.....#########################....."
        XCTAssertEqual(sut.currentGuard.getLoggedSleep.first!, hej)
    }

    func testZ() {
        let input = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-01 23:58] Guard #99 begins shift",
            "[1518-11-02 00:40] falls asleep",
            "[1518-11-02 00:50] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
            "[1518-11-04 00:02] Guard #99 begins shift",
            "[1518-11-04 00:36] falls asleep",
            "[1518-11-04 00:46] wakes up",
            "[1518-11-05 00:03] Guard #99 begins shift",
            "[1518-11-05 00:45] falls asleep",
            "[1518-11-05 00:55] wakes up",
        ]
        for line in input {
            sut.parseLine(line)
        }
        let expected = [
            ".....####################.....#########################.....",
            "........................#####...............................",
            "........................................##########..........",
            "....................................##########..............",
            ".............................................##########.....",
        ]
        let result = sut.guards[0].getLoggedSleep + sut.guards[1].getLoggedSleep
        XCTAssertEqual(result, expected)
    }

    func testWhatGuardSleptTheMost() {
        let input = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-01 23:58] Guard #99 begins shift",
            "[1518-11-02 00:40] falls asleep",
            "[1518-11-02 00:50] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
            "[1518-11-04 00:02] Guard #99 begins shift",
            "[1518-11-04 00:36] falls asleep",
            "[1518-11-04 00:46] wakes up",
            "[1518-11-05 00:03] Guard #99 begins shift",
            "[1518-11-05 00:45] falls asleep",
            "[1518-11-05 00:55] wakes up",
        ]
        for line in input {
            sut.parseLine(line)
        }

        let result = sut.guardWithMostSleep()
        XCTAssertEqual(result.ID, 10)
    }

    func testWhatMinuteThisGuardSleptTheMost() {
        let input = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-01 23:58] Guard #99 begins shift",
            "[1518-11-02 00:40] falls asleep",
            "[1518-11-02 00:50] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
            "[1518-11-04 00:02] Guard #99 begins shift",
            "[1518-11-04 00:36] falls asleep",
            "[1518-11-04 00:46] wakes up",
            "[1518-11-05 00:03] Guard #99 begins shift",
            "[1518-11-05 00:45] falls asleep",
            "[1518-11-05 00:55] wakes up",
        ]
        for line in input {
            sut.parseLine(line)
        }

        let mostSleepy = sut.guardWithMostSleep()
        let result = mostSleepy.minuteSpentMostAsleep
        XCTAssertEqual(result, 24)
    }

}
