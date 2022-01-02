import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .map
    
    enum Tab {
        case map
        case detail
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MapHome()
                .tabItem{
                    Label("Map", systemImage: "map")
                }
                .tag(Tab.map)
            
            MapHome()
                .tabItem{
                    Label("Map", systemImage: "map")
                }
                .tag(Tab.detail)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
