
import SwiftUI


struct ContentView: View {
    @State var part1Value = ""
    @State var part2Value = ""
    var body: some View {
        VStack {
            Button("Generate Part 1") {
                self.part1Value = PassportProcessing().generatePartOne(fromFile: "InputDay4")
                print(self.part1Value)
            }.padding()
            Button("Generate Part 2") {
                self.part2Value = PassportProcessing().generatePartTwo(fromFile: "InputDay4")
                print(self.part2Value)
            }.padding()
            Text("Part 1: \(part1Value)")
                .padding()
            Text("Part 2: \(part2Value)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}