import SwiftUI
import RealmSwift

struct EventItemEdit: View {
    
    @ObservedRealmObject var item: Item
    
    // TODO: fix 値を1つ変えただけで画面が戻ってしまう
    var body: some View {
        VStack(alignment: .center){
            
            SquareImageView(image: Image(item.imageName))
            
            HStack(alignment: .center, spacing: 15){
                Text("状態")
                Image(systemName: item.isActive ? "leaf.fill" : "leaf")
                Toggle(item.isActive ? "栽培中" : "栽培終了", isOn: $item.isActive)
            }
            
            HStack(alignment: .center, spacing: 15){
                Text("概要")
                TextField("", text: $item.name)
                    .frame(width: 300, height: 30)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
            }

            HStack(alignment: .center, spacing: 15){
                Text("詳細")
                TextEditor(text: $item.detail)
                    .frame(width: 300, height: 200)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
            }

            HStack(alignment: .center, spacing: 15){
                Text("場所")
                HStack(alignment: .center){
                    TextField("", value: $item.coordinates_x, formatter: NumberFormatter())
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                        .keyboardType(.decimalPad)
                    TextField("", value: $item.coordinates_y, formatter: NumberFormatter())
                        .cornerRadius(5)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                        .keyboardType(.decimalPad)
                }
                .padding()
            }
        }
        .navigationBarTitle("編集", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
              Button("完了") {
                  print("編集完了")
              }
            }
        }
        .padding()
    }
}

struct EventItemEdit_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        EventItemEdit(item: item)
    }
}
