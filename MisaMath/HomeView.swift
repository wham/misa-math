import SwiftUI

struct HomeView: View {
    var body: some View {
        return NavigationView {
            NewTestView().navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
