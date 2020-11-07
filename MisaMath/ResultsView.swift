import SwiftUI

struct ResultsView: View {
    @ObservedObject var results: Results
    
    var body: some View {
        VStack {
            HStack {
                Text("Easy:")
                Spacer()
                Text(String(results.easyCorrect))
                Text("/")
                Text("4")
            }
            HStack {
                Text("Medium:")
                Spacer()
                Text("12")
                Text("/")
                Text("4")
            }
            HStack {
                Text("Hard:")
                Spacer()
                Text("12")
                Text("/")
                Text("4")
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(results: Results())
    }
}
