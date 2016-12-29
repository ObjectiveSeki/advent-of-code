
import Foundation


struct Factory {
    
    var bins = [OutputBin]()
    var bots: [Bot]
    
    var responsibleBot: Bot? = nil
    var respValues: [Microchip]? = nil
    
    init(bots: [Bot]) {
        self.bots = bots
    }
    
    
    mutating func zooming(with instructions: [BotInstruction]) {
        // First bot with Two chips
        guard let botIndex = bots.index(where: { $0.microchips.count == 2 }) else { return }
        let bot = bots[Int(botIndex)]
        
        // First instruction for that bot
        let instructionIndex = instructions.index(where: { $0.botNumber == bot.number})!
        let instruction = instructions[instructionIndex]
        
        // Sort the microchips for low and high
        let sortedChips = bot.microchips.sorted(by: { $0.value < $1.value })
        
        // Find out who the responsible bot is
        if sortedChips[0].value == respValues![0].value &&
            sortedChips[1].value == respValues![1].value {
            responsibleBot = bot
        }
        
        // Take the two microships and give low and high
        give(sortedChips[0], to: instruction.low)
        give(sortedChips[1], to: instruction.high)
        
        // Remove the microchips from the bot
        bots[Int(botIndex)].microchips = []
        
        // Do this again
        zooming(with: instructions)
    }
    
    mutating func give(_ microchip: Microchip, to destination:Destination) {
        switch destination.who {
        case .bot:
            if let index = bots.index(where: { $0.number == destination.number }) {
                bots[Int(index)].microchips.append(microchip)
            } else {
                bots.append(Bot(number: destination.number, microchips: [microchip]))
            }
        case .output:
            if let index = bins.index(where: { $0.number == destination.number}) {
                bins[Int(index)].microships.append(microchip)
            } else {
                bins.append(OutputBin(number: destination.number, microships: [microchip]))
            }
        }
    }
    
}
