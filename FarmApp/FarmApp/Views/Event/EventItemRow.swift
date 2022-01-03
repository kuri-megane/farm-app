import SwiftUI
import RealmSwift

struct EventItemRow: View {
    /// The group is a container for a list of items. Using a group instead of all items
    /// directly allows us to maintain a list order that can be updated in the UI.
    @ObservedRealmObject var group: Group

    /// The button to be displayed on the top left.
    var leadingBarButton: AnyView?

    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(group.items) { item in
                        EventItem(item: item)
                    }
                }
            }
            .frame(height: 200)
            

            // Action bar at bottom contains Add button.
            HStack {
                Spacer()
                Button(action: {
                    // The bound collection automatically
                    // handles write transactions, so we can
                    // append directly to it.
                    $group.items.append(Item())
                }) { Image(systemName: "plus") }
            }.padding()
        }
        
    }
}


struct EventItems_Previews: PreviewProvider {
    static var previews: some View {
        let group = Group()
        EventItemRow(group: group)
    }
}
