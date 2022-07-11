//
//  AOC2021App.swift
//  AOC2021
//
//  Created by Niclas Eriksson on 2022-07-02.
//

import SwiftUI

@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            AOC2021App.main()
        } else {
            TestApp.main()
        }
    }
}
struct AOC2021App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
}
