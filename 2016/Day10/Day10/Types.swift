
import Foundation


enum BotOrOutput: String {
    case bot
    case output
}

struct Microchip {
    let value: Int
}
struct Bot {
    let number: Int
    var microchips: [Microchip]
}

struct Destination {
    let who: BotOrOutput
    let number: Int
}

struct BotInstruction {
    let botNumber: Int
    let low: Destination
    let high: Destination
}

struct OutputBin {
    let number: Int
    var microships: [Microchip]
}
