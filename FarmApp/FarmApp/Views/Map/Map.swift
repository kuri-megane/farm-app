import SwiftUI

struct Map: View {
    
    // 画像は仮置
    var mapImage = Image("map_sample")
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal){
                // 指定したフレームに合わせつつ，縦横比維持
                mapImage.renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 300)
            }
        }
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapHome()
    }
}
