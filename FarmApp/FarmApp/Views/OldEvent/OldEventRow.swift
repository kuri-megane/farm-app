import SwiftUI

struct OldEventRow: View {
    var categoryName: String
    var items: [Event]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
        
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { event in
                        NavigationLink(destination: OldEventDetail(event: event)){
                            OldEventItem(event: event)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var events = ModelData().events
    static var previews: some View {
        OldEventRow(
            categoryName: events[0].category.rawValue,
            items: Array(events.prefix(4)))
    }
}
