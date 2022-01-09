import SwiftUI
import RealmSwift

struct Map: View {
    
    @ObservedRealmObject var group: Group
    
    // 画像は仮置
    var mapImage = Image("map_sample")
    
    var body: some View {
        ScrollView(.horizontal){
            ZStack(alignment: .topLeading){
                // 背景の畑画像
                VStack(alignment: .leading) {
                    // 指定したフレームに合わせつつ，縦横比維持
                    mapImage.renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 500, height: 300)
                }
                
                // イベントアイテム
                ForEach(group.items) { item in
                    MapItem(item: item)
                        .frame(width: 35, height: 35)
                        .offset(x: CGFloat(item.coordinates_x), y: CGFloat(item.coordinates_y))
                    
                }
            }
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        let group = Group()
        Map(group: group)
    }
}
