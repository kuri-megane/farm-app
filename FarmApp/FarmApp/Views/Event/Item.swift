import SwiftUI
import RealmSwift

/// An individual item. Part of a `Group`.
final class Item: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    
    // 生成時は入力を促す文字列にする
    @Persisted var name = "未入力"
    @Persisted var isActive = true
    @Persisted var detail = "未入力"
    @Persisted var imageName = "daikon"
    
    // TODO: できれば(x,y)のリスト形式に
    @Persisted var coordinates_x = 0
    @Persisted var coordinates_y = 0
    

    /// The backlink to the `Group` this item is a part of.
    @Persisted(originProperty: "items") var group: LinkingObjects<Group>
}
