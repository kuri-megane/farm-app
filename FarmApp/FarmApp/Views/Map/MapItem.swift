import SwiftUI
import RealmSwift

struct MapItem: View {
    @ObservedRealmObject var item: Item
    @State private var isShowSubView = false
    
    var body: some View {
        
            VStack(alignment: .leading){
                NavigationLink(destination: EventItemDetail(item: item, isShowSubView: $isShowSubView)) {
                    CircleImageView(image: Image(item.imageName))
                        .frame(width: 50, height: 50)
                }
            }
        
    }
}

struct MapItem_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        MapItem(item: item)
    }
}
