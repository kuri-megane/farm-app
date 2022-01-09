import SwiftUI
import RealmSwift

struct EventItemDetail: View {
    @ObservedRealmObject var item: Item
    @State private var show: Bool = false
    
    var body: some View {
        VStack(alignment: .center){
            
            HStack(alignment: .center, spacing: 5){
                if item.isActive {
                    Image(systemName: "leaf.fill")
                    Text("栽培中")
                } else {
                    Image(systemName: "leaf")
                    Text("栽培終了")
                }
            }
            
            SquareImageView(image: Image(item.imageName))
            
            Text(item.name)
                .font(.title2)
            
            Divider()
            
            Text(item.detail)
                .frame(width: 300, height: 200)
            
        }
        .navigationBarTitle("詳細", displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: { self.show.toggle() }) {
                    Text("編集")
                }
                // EventItemEditは値を変えただけで画面が戻ってしまうためsheetを採用
                .sheet(isPresented: self.$show) {
                    EventItemEdit(item: item)
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
