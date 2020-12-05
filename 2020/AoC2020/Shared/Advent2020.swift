//
//  Advent2020.swift
//  AoC2020
//
//  Created by Niclas Eriksson on 2020-12-04.
//

import SwiftUI

struct Advent2020: View {
    var days: [Generatable] = []
    var body: some View {
        NavigationView {
            List() {
//                for i in 0..<days.count {
//
//                }
//                ForEach(days) { day in
//                    View
//                    SandwichCell(sandwich: sandwich)
//                }
//                HStack {
//                    Spacer()
//                    Text("\(sandwiches.count) sandwiches")
//                        .foregroundColor(.secondary)
//                    Spacer()
//                }
            }
            .navigationTitle("Sandwiches")
        }
    }
}

struct Advent2020_Previews: PreviewProvider {
    static var previews: some View {
        Advent2020()
    }
}
