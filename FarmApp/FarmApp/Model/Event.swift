import Foundation
import SwiftUI
import CoreLocation

struct Event: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isActive: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var activeImage: Image? {
        isActive ? Image(imageName + "_active") : nil
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
