
import Foundation


struct IPAddressValidator {
    
    let list: [IPAddress]
    
    func numberOfValidAddresses() -> Int {
        let filteredList = list.filter { (address) -> Bool in
            return address.supportsTLS()
        }
        return filteredList.count
    }
    
    func numberOfSSLAddresses() -> Int {
        let filteredList = list.filter { (address) -> Bool in
            return address.supportsSSL()
        }
        return filteredList.count
    }
    
}
