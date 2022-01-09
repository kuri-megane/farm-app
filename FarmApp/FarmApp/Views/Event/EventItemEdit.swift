import SwiftUI
import RealmSwift

struct EventItemEdit: View {
    @ObservedRealmObject var item: Item
    
    var body: some View {
        VStack(alignment: .center){
            List {
                // 画像
                Section {
                    SquareImageView(image: Image(item.imageName))
                }
                // 栽培状態
                Section{
                    HStack(alignment: .center, spacing: 15){
                        Text("状態")
                        Image(systemName: item.isActive ? "leaf.fill" : "leaf")
                        Toggle(item.isActive ? "栽培中" : "栽培終了", isOn: $item.isActive)
                    }
                }
                // 説明欄
                Section {
                    TextField("概要", text: $item.name)
                    TextEditor(text: $item.detail)
                        .frame(width: 300, height: 200)
                }
                // Map上の位置
                Section {
                    HStack(alignment: .center){
                        Text("場所")
                        TextField("", value: $item.coordinates_x, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                        TextField("", value: $item.coordinates_y, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                    }
                }
            }
        }
        .navigationBarTitle("編集", displayMode: .inline)
        .padding()
    }
}

struct EventItemEdit_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        EventItemEdit(item: item)
    }
}
