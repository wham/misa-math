import SwiftUI

struct ResultsView: View {
    @ObservedObject var results: Results
    
    var body: some View {
        VStack {
            HStack {
                Text("Easy:")
                Spacer()
                Text(String(results.easyCorrect)).foregroundColor(.green)
                Text("/")
                Text(String(results.easyIncorrect)).foregroundColor(.red)
            }
            HStack {
                Text("Medium:")
                Spacer()
                Text(String(results.mediumCorrect)).foregroundColor(.green)
                Text("/")
                Text(String(results.mediumIncorrect)).foregroundColor(.red)
            }
            HStack {
                Text("Hard:")
                Spacer()
                Text(String(results.hardCorrect)).foregroundColor(.green)
                Text("/")
                Text(String(results.hardIncorrect)).foregroundColor(.red)
            }
            Button(action: {
                self.results.clear()
            }) {
                Text("Clear")
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(results: Results())
    }
}
