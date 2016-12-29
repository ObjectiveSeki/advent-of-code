

import XCTest
@testable import Day10


class Day10Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBotsCount() {
        let sut = BotsFileReader()
        dump(sut.readBots(from: "TestData"))
        XCTAssert(sut.readBots(from: "TestData")?.count == 2)
    }
    
    func testInstructionsCount() {
        let sut = BotsFileReader()
        dump(sut.readInstructions(from: "TestData"))
        XCTAssert(sut.readInstructions(from: "TestData")?.count == 3)
    }
    
    func testZooming() {
        let reader = BotsFileReader()
        let bots = reader.readBots(from: "TestData")!
        let instructions = reader.readInstructions(from: "TestData")!
        
        var sut = Factory(bots: bots)
        sut.zooming(with: instructions)
        XCTAssert(sut.bins.count == 3)
    }
    
    func testResponsibliity() {
        let reader = BotsFileReader()
        let bots = reader.readBots(from: "TestData")!
        let instructions = reader.readInstructions(from: "TestData")!
        
        var sut = Factory(bots: bots)
        sut.respValues = [Microchip(value: 2), Microchip(value: 5)]
        sut.zooming(with: instructions)
        
        XCTAssert(sut.responsibleBot?.number == 2)
    }
    
    
    // MARK: Test Give to Bots
    
    func testBots_FirstChip() {
        
        let bot = Bot(number: 42, microchips: [])
        var sut = Factory(bots: [bot])
        
        let chip = Microchip(value: 1337)
        let dest = Destination(who: BotOrOutput.bot, number: 42)
        sut.give(chip, to: dest)
        
        XCTAssert(sut.bots.first?.microchips.count == 1)
        XCTAssert(sut.bots.first?.microchips.first?.value == 1337)
    }
    
    func testBots_SecondChip() {
        
        let bot = Bot(number: 0, microchips: [])
        var sut = Factory(bots: [bot])
        
        let chip1 = Microchip(value: 42)
        let chip2 = Microchip(value: 1337)
        let dest = Destination(who: BotOrOutput.bot, number: 0)
        sut.give(chip1, to: dest)
        sut.give(chip2, to: dest)
        
        XCTAssert(sut.bots.first?.microchips.count == 2)
        XCTAssert(sut.bots.first?.microchips.first?.value == 42)
        XCTAssert(sut.bots.first?.microchips.last?.value == 1337)
    }
    
    func testBots_ThirdChipToSecondBot() {
        
        let bot1 = Bot(number: 1985, microchips: [])
        let bot2 = Bot(number: 1994, microchips: [])
        var sut = Factory(bots: [bot1, bot2])
        
        let chip1 = Microchip(value: 42)
        let chip2 = Microchip(value: 1337)
        let dest1 = Destination(who: BotOrOutput.bot, number: 1985)
        let dest2 = Destination(who: BotOrOutput.bot, number: 1994)
        sut.give(chip1, to: dest1)
        sut.give(chip2, to: dest1)
        sut.give(chip1, to: dest2)
        sut.give(chip2, to: dest2)
        
        XCTAssert(sut.bots.first?.number == 1985)
        XCTAssert(sut.bots.first?.microchips.count == 2)
        XCTAssert(sut.bots.first?.microchips.first?.value == 42)
        XCTAssert(sut.bots.first?.microchips.last?.value == 1337)
        
        XCTAssert(sut.bots.last?.number == 1994)
        XCTAssert(sut.bots.last?.microchips.count == 2)
        XCTAssert(sut.bots.last?.microchips.first?.value == 42)
        XCTAssert(sut.bots.last?.microchips.last?.value == 1337)
    }
    
    
    // Mark: Test Give to Bins
    
    func testBins_FirstChip() {
        let chip = Microchip(value: 1337)
        let dest = Destination(who: BotOrOutput.output, number: 0)
        var sut = Factory(bots: [])
        sut.give(chip, to: dest)
        
        XCTAssert(sut.bins.count == 1)
        XCTAssert(sut.bins.first?.microships.count == 1)
        XCTAssert(sut.bins.first?.microships.first?.value == 1337)
    }
    
    func testBins_SecondChip() {
        let chip1 = Microchip(value: 42)
        let chip2 = Microchip(value: 1337)
        let dest = Destination(who: BotOrOutput.output, number: 0)
        var sut = Factory(bots: [])
        sut.give(chip1, to: dest)
        sut.give(chip2, to: dest)
        
        XCTAssert(sut.bins.count == 1)
        XCTAssert(sut.bins.first?.microships.count == 2)
        XCTAssert(sut.bins.first?.microships.first?.value == 42)
        XCTAssert(sut.bins.first?.microships.last?.value == 1337)
    }
    
    func testBins_ThirdChipToSecondBin() {
        let chip1 = Microchip(value: 42)
        let chip2 = Microchip(value: 1337)
        let dest1 = Destination(who: BotOrOutput.output, number: 0)
        let dest2 = Destination(who: BotOrOutput.output, number: 42)
        var sut = Factory(bots: [])
        sut.give(chip1, to: dest1)
        sut.give(chip2, to: dest1)
        sut.give(chip1, to: dest2)
        sut.give(chip2, to: dest2)
        
        XCTAssert(sut.bins.count == 2)
        XCTAssert(sut.bins.first?.number == 0)
        XCTAssert(sut.bins.first?.microships.count == 2)
        XCTAssert(sut.bins.first?.microships.first?.value == 42)
        XCTAssert(sut.bins.first?.microships.last?.value == 1337)
        XCTAssert(sut.bins.last?.number == 42)
        XCTAssert(sut.bins.last?.microships.count == 2)
        XCTAssert(sut.bins.last?.microships.first?.value == 42)
        XCTAssert(sut.bins.last?.microships.last?.value == 1337)
    }
    
}
