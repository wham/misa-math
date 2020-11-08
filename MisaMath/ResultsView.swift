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
                Text(String(results.easyIncorrect))
            }
            HStack {
                Text("Medium:")
                Spacer()
                Text(String(results.mediumCorrect))
                Text("/")
                Text(String(results.mediumIncorrect))
            }
            HStack {
                Text("Hard:")
                Spacer()
                Text(String(results.hardCorrect))
                Text("/")
                Text(String(results.hardIncorrect))
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(results: Results())
    }
}
