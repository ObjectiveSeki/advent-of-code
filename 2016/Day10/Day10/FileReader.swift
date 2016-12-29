
import Foundation


protocol FileReader {
    func string(fromFile name: String) -> String?
    func fileData(from url: URL) -> Data
}

extension FileReader {
    
    internal func string(fromFile name: String) -> String? {
        let url = bundleURL(from: name)
        return try? String(contentsOf: url)
    }
    
    internal func fileData(from url: URL) -> Data {
        var data = Data()
        do {
            data = try Data(contentsOf: url)
        } catch let error as NSError {
            dump(error.localizedDescription)
        }
        return data
    }
    
    internal func bundleURL(from name: String) -> URL {
        let file = Bundle.main.path(forResource: name, ofType: nil)
        return URL(fileURLWithPath: file!)
    }
    
}


struct BotsFileReader: FileReader {
    
    func readBots(from file: String) -> [Bot]? {
        let pat = "value (\\d+) goes to bot (\\d+)"
        let matches = string(fromFile: file)?.matchingStrings(regex: pat)
        guard let bots = matches?.map({ (array) -> Bot in
            let number = Int(array[2])!
            let value = Int(array[1])!
            return Bot(number: number, microchips: [Microchip(value: value)])
        }) else { return nil }
        
        var uniqueBots = [Bot]()
        for bot in bots {
            if let index = uniqueBots.index(where: { $0.number == bot.number }) {
                uniqueBots[index].microchips.append(bot.microchips[0])
            } else {
                uniqueBots.append(bot)
            }
        }
        return uniqueBots
    }
    
    func readInstructions(from file: String) -> [BotInstruction]? {
        let pat = "bot (\\d+) gives low to (\\w+) (\\d+) and high to (\\w+) (\\d+)"
        let matches = string(fromFile: file)?.matchingStrings(regex: pat)
        return matches?.map({ (array) -> BotInstruction in
            let number = Int(array[1])!
            let lowWho = BotOrOutput(rawValue: array[2])!
            let lowNumber = Int(array[3])!
            let low = Destination(who: lowWho, number: lowNumber)
            
            let highWho = BotOrOutput(rawValue: array[4])!
            let highNumber = Int(array[5])!
            let high = Destination(who: highWho, number: highNumber)
            
            return BotInstruction(botNumber: number, low: low, high: high)
            
        })
    }
    
}
