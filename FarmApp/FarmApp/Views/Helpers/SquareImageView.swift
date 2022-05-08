import SwiftUI

struct SquareImageView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 155, height: 155)
            .cornerRadius(20)
    }
}

struct SquareImageView_Previews: PreviewProvider {
    static var previews: some View {
        SquareImageView(image: Image("daikon"))
    }
}
