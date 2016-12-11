
import XCTest
@testable import Day7


class Day7Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testRange_abbaIsValid() {
        let sut = AddressRange(string: "abba")
        XCTAssert(sut.isValid() == true)
    }
    
    func testRange_ioxxojIsValid() {
        let sut = AddressRange(string: "ioxxoj")
        XCTAssert(sut.isValid() == true)
    }
    
    func testRange_aaaaIsNOTValid() {
        let sut = AddressRange(string: "aaaa")
        XCTAssert(sut.isValid() == false)
    }
    
    func testIPAddress_abba_mnop_qrst_IsValid() {
        let sut = IPAddress(address: "abba[mnop]qrst")
        XCTAssert(sut.supportsTLS() == true)
    }
    
    func testIPAddress_xyyx_IsValid() {
        let sut = IPAddress(address: "abcd[aoeu]xyyx")
        XCTAssert(sut.supportsTLS() == true)
    }
    
    func testIPAddress_abcd_bddb_xyyx_IsNOTValid() {
        let sut = IPAddress(address: "abcd[bddb]xyyx")
        XCTAssert(sut.supportsTLS() == false)
    }
    
    func testIPAddress_aaaa_qwer_tyui_IsNOTValid() {
        let sut = IPAddress(address: "aaaa[qwer]tyui")
        XCTAssert(sut.supportsTLS() == false)
    }
    
    func testIPAddress_ioxxoj_asdfgh_zxcvbn_IsValid() {
        let sut = IPAddress(address: "ioxxoj[asdfgh]zxcvbn")
        XCTAssert(sut.supportsTLS() == true)
    }
    
    func testIDAddress_aoeuaoeu_IsNOTValid() {
        let sut = IPAddress(address: "aoeuaoeu[aoeuaoeu]aoeuaoeu[aooa]aoeuoaeu[aoueaoeu]aooa")
        XCTAssert(sut.supportsTLS() == false)
    }
    
    func testIDAddress_aoeuaoeu_IsValid() {
        let sut = IPAddress(address: "aoeuaoeu[aoeuaoeu]aoeuaoeu[aoeuaoeu]aoeuoaeu[aoueaoeu]aooa")
        XCTAssert(sut.supportsTLS() == true)
    }
    
    func testValidator_TestDataHasOneValidIPAddress() {
        let addresses = IPAddressFileReader().IPAddresses(fromFile: "TestData")
        let sut = IPAddressValidator(list: addresses)
        XCTAssert(sut.numberOfValidAddresses() == 1)
    }
    
    func testSSL_aba_bab_xyz_IsValid() {
        let sut = IPAddress(address: "aba[bab]xyz")
        XCTAssert(sut.supportsSSL() == true)
    }
    
    func testSSL_xyx_xyx_xyx_IsNotValid() {
        let sut = IPAddress(address: "xyx[xyx]xyx")
        XCTAssert(sut.supportsSSL() == false)
    }
    
    func testSSL_aaa_kek_eke_IsValid() {
        let sut = IPAddress(address: "aaa[kek]eke")
        XCTAssert(sut.supportsSSL() == true)
    }
    
    func testSSL_aaa_aaa_eke_IsNotValid() {
        let sut = IPAddress(address: "aaa[aaa]eke")
        XCTAssert(sut.supportsSSL() == false)
    }
    
    func testSSL_zazbz_bzb_cdb_IsValid() {
        let sut = IPAddress(address: "zazbz[bzb]cdb")
        XCTAssert(sut.supportsSSL() == true)
    }

}
