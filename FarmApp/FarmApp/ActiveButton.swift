import SwiftUI

struct ActiveButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct ActiveButton_Previews: PreviewProvider {
    static var previews: some View {
        ActiveButton(isSet: .constant(true))
    }
}
