import SwiftUI
import RealmSwift

struct EventItemDetail: View {
    @ObservedRealmObject var item: Item
    @State private var show: Bool = false
    @State private var showingAlert = false
    @Binding var isShowSubView: Bool
    
    var body: some View {
        if !item.isInvalidated {
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
                    .frame(width: 155, height: 155)
                
                Text(item.name)
                    .font(.title2)
                
                Divider()
                
                Text(item.detail)
                    .frame(width: 300, height: 200)
                
            }
            .navigationBarTitle("詳細", displayMode: .inline)
            .toolbar {
                // 完了ボタン
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("削除", role: .destructive) {
                        self.showingAlert = true
                    }
                    .alert("記録の削除", isPresented: $showingAlert) {
                        Button("了解") {
                            self.isShowSubView = false
                            $item.delete()
                        }
                    } message: {
                        Text("この記録を本当に削除しますか？")
                    }
                }
                // 編集ボタン
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
}

struct EventItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        EventItemDetail(item: item, isShowSubView: .constant(true))
    }
}
