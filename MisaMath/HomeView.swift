import SwiftUI

struct HomeView: View {
    var results = Results()
    
    var body: some View {
        return NavigationView {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("New Test").font(.title)
                        Spacer()
                    }
                    NewTestView(results: results)
                    HStack {
                        Text("Results").font(.title)
                        Spacer()
                    }
                    ResultsView(results: results)
                    Spacer()
                }.navigationBarTitle("Home")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
