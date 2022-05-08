import SwiftUI
import RealmSwift

struct Home: View {
    @ObservedResults(Group.self) var groups
    
    var body: some View {
        NavigationView {
            List{
                if let group = groups.first {
                    Map(group: group)
                    EventItemRow(group: group)
                } else {
                    // For this small app, we only want one group in the realm.
                    // You can expand this app to support multiple groups.
                    // For now, if there is no group, add one here.
                    ProgressView().onAppear {
                        $groups.append(Group())
                    }
                }
            }
            .navigationTitle("畑アプリ")
            .listStyle(InsetListStyle())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
