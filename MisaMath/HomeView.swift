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
                    NewTestView(results: results).padding(.bottom)
                    HStack {
                        Text("Results").font(.title)
                        Spacer()
                        Button(action: {
                            self.results.clear()
                        }) {
                            Text("Clear").foregroundColor(.red).font(.footnote)
                            Image(systemName: "trash").foregroundColor(.red)
                        }
                    }
                    ResultsView(results: results)
                    Spacer()
                }.navigationBarTitle("Home").navigationBarHidden(true).padding(.all)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}
