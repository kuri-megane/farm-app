import SwiftUI
import RealmSwift

struct EventItemDetail: View {
    @ObservedRealmObject var item: Item
    
    var body: some View {
        VStack(alignment: .center){
            
            SquareImageView(image: Image(item.imageName))
            
            HStack(alignment: .center, spacing: 5){
                if item.isActive {
                    Image(systemName: "leaf.fill")
                    Text("栽培中")
                } else {
                    Image(systemName: "leaf")
                }
            }
            
            Text(item.name)
                .font(.title2)
            
            Divider()
            
            Text(item.detail)
                .frame(width: 300, height: 200)
            
        }
        .navigationBarTitle("詳細", displayMode: .inline)
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarTrailing) {
              NavigationLink(destination: EventItemEdit(item: item)){
                  Text("編集")
              }
          }
        }
        .padding()
    }
}

struct EventItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        EventItemDetail(item: item)
    }
}
