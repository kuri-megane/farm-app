import SwiftUI
import RealmSwift

struct EventItem: View {
    @ObservedRealmObject var item: Item

    var body: some View {
        NavigationLink(destination: EventItemDetail(item: item)) {
            VStack(alignment: .leading){
                // 画像
                SquareImageView(image: Image(item.imageName))
                    .frame(width: 155, height: 155)
                // イベント名
                Text(item.name)
                    .foregroundColor(.primary)
                    .font(.caption)
                // アクティブ
                if item.isActive {
                    Image(systemName: "leaf.fill")
                }
            }.padding(.leading, 15)
        }
    }
}

struct EventItem_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        EventItem(item: item)
    }
}
