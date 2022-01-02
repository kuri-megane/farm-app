import SwiftUI

struct MapHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List{
                Map()
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    EventRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("畑アプリ")
            .listStyle(InsetListStyle())
        }
    }
}

struct MapHome_Previews: PreviewProvider {
    static var previews: some View {
        MapHome()
            .environmentObject(ModelData())
    }
}
