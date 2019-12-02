
import Foundation


struct FuelModule {
    let mass: Int
    var fuelNeeded: Int {
        return mass / 3 - 2
    }
    func fuelReallyNeeded() -> Int {
        return reallyNeeded(mass: mass)
    }
    private func reallyNeeded(mass: Int) -> Int {
        if Int(mass / 3) - 2 <= 0 {
            return 0
        }
        let fuel = mass / 3 - 2
        return fuel + reallyNeeded(mass: fuel)
    }
}


struct FuelCounter: FileReader, Generatable {


    // MARK: Logic

    func countFuelNeeded(for modules: [FuelModule]) -> Int {
        var total = 0
        for module in modules {
            total += module.fuelNeeded
        }
        return total
    }

    func countFuelReallyNeeded(for modules: [FuelModule]) -> Int {
        var total = 0
        for module in modules {
            total += module.fuelReallyNeeded()
        }
        return total
    }


    // MARK: Generatable

    func generatePartOne(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input).map { Int($0)! }
        let modules = array.map { FuelModule(mass: $0) }
        return String(countFuelNeeded(for: modules))
    }

    func generatePartTwo(fromFile input: String) -> String {
        let array = stringArrayNewLine(fromFile: input).map { Int($0)! }
        let modules = array.map { FuelModule(mass: $0) }
        return String(countFuelReallyNeeded(for: modules))
    }

}
