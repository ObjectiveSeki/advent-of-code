
import XCTest
@testable import Day4


class Day4Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRoom1_IsReal() {
        let room = Room(encryptedRoom: "aaaaa-bbb-z-y-x-123[abxyz]")
        XCTAssertTrue(room.isReal())
    }
    
    func testRoom2_IsReal() {
        let room = Room(encryptedRoom: "a-b-c-d-e-f-g-h-987[abcde]")
        XCTAssertTrue(room.isReal())
    }
    
    func testRoom3_IsReal() {
        let room = Room(encryptedRoom: "not-a-real-room-404[oarel]")
        XCTAssertTrue(room.isReal())
    }
    
    func testRoom4_IsDecoy() {
        let room = Room(encryptedRoom: "totally-real-room-200[decoy]")
        XCTAssertFalse(room.isReal())
    }
    
    func testSumOfRooms() {
        let room1 = Room(encryptedRoom: "aaaaa-bbb-z-y-x-123[abxyz]")
        let room2 = Room(encryptedRoom: "a-b-c-d-e-f-g-h-987[abcde]")
        let room3 = Room(encryptedRoom: "not-a-real-room-404[oarel]")
        let room4 = Room(encryptedRoom: "totally-real-room-200[decoy]")
        let rooms = [room1, room2, room3, room4]
        let sut = EasterBunnyHQ(rooms: rooms)
        XCTAssert(sut.sumOfSectorIDsFromRealRooms() == 1514)
    }
    
    func testSumOfRoomsFileData() {
        let rooms = RoomFileReader().rooms(fromFile: "RoomDataSmall")
        let sut = EasterBunnyHQ(rooms: rooms)
        XCTAssert(sut.sumOfSectorIDsFromRealRooms() == 1514)
    }
    
    
    func testDercyptRoomName() {
        let room = Room(encryptedRoom: "qzmt-zixmtkozy-ivhz-343")
        dump(room.realName())
        XCTAssert(room.realName() == "very encrypted name")
    }
    
    
}
