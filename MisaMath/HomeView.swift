import SwiftUI

struct HomeView: View {
    var body: some View {
        return NavigationView {
            VStack {
                HStack {
                    Text("New Test").font(.title)
                    Spacer()
                }
                NewTestView()
                HStack {
                    Text("Results").font(.title)
                    Spacer()
                }
                ResultsView()
                Spacer()
            }.navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
