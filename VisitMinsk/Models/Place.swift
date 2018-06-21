import UIKit

// represent generic place

class Place {
    
    var title: String
    var description: String
    var image: UIImage
    
    init(title: String, description: String, imageName: String) {
        self.title = title
        self.description = description
        if let image = UIImage(named: imageName) {
            self.image = image
        } else {
            self.image = UIImage(named: "1_21")!
        }
    }
}
