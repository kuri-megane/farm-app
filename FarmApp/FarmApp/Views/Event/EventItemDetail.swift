import SwiftUI
import RealmSwift

struct EventItemDetail: View {
    @ObservedRealmObject var item: Item
    
    
    var body: some View {
        NavigationView {
            ScrollView {
            
                VStack(alignment: .center){
                    
                    SquareImageView(image: Image(item.imageName))
                    
                    HStack(alignment: .center, spacing: 5){
                        Text("概要")
                        TextField("", text: $item.name)
                            .frame(width: 300, height: 30)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                    }
                    
                    HStack(alignment: .center, spacing: 5){
                        Text("詳細")
                        TextEditor(text: $item.detail)
                            .frame(width: 300, height: 200)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                    }
                    
                    HStack(alignment: .center, spacing: 5){
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
                    }
                }
                .navigationBarItems(trailing: Toggle(isOn: $item.isActive) {
                    if item.isActive {
                        Image(systemName: "leaf.fill")
                        Text("栽培中")
                    } else {
                        Image(systemName: "leaf")
                    }
                })
            }
            .padding()
        }
        
    }
}

struct EventItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        let item = Item()
        EventItemDetail(item: item)
    }
}
