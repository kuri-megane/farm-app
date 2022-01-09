import SwiftUI
import RealmSwift

struct MapItem: View {
    @ObservedRealmObject var item: Item
    
    var body: some View {
        
            VStack(alignment: .leading){
                NavigationLink(destination: EventItemDetail(item: item)) {
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 30, height: 30)
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
