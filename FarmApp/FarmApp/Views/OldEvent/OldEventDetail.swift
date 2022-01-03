import SwiftUI

struct OldEventDetail: View {
    @EnvironmentObject var modelData: ModelData
    var event: Event

    var eventIndex: Int {
        modelData.events.firstIndex(where: { $0.id == event.id })!
    }

    var body: some View {
        ScrollView {
            
            SquareImageView(image: event.image)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(event.name)
                        .font(.title)
                    ActiveButton(isSet: $modelData.events[eventIndex].isActive)
                }

                Divider()

                Text("About \(event.name)")
                    .font(.title2)
                Text(event.description)
            }
            .padding()
        }
        .navigationTitle(event.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EventDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        OldEventDetail(event: modelData.events[0])
            .environmentObject(modelData)
    }
}
