import SwiftUI

struct EventItem: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            event.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(20)
            
            Text(event.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct EventItemItem_Previews: PreviewProvider {
    static var previews: some View {
        EventItem(event: ModelData().events[0])
    }
}
