import UIKit

// represent generic place

class Place {
    
    var name: String
    var category: String
    var description: String
    var photo: String
    var index: Int
    
    init(name: String, category: String, description: String, photo: String, index: Int) {
        self.name = name
        self.category = category
        self.description = description
        self.photo = photo
        self.index = index
    }
    
    // do I need convenience init in this app?
}
