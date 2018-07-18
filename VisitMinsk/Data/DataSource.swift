import Foundation

class DataSource {
    
    private var places = [Place]()
    private var categories = [String]()
    
    var count: Int {
        return places.count
    }
    
    var numberOfCategories: Int {
        return categories.count
    }
    
    // MARK: - Private
    private func loadPlacesFromDisk() -> [Place] {
        
        // why do I need this?
        //categories.removeAll(keepingCapacity: false)
        
        if let path = Bundle.main.path(forResource: "Places", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var minskPlaces = [Place]()
                for item in dictArray {
                    if let dictionary = item as? NSDictionary {
                        let name = dictionary["name"] as! String
                        let category = dictionary["category"] as! String
                        let description = dictionary["description"] as! String
                        let photo = dictionary["photo"] as! String
                        let index = dictionary["index"] as! Int
                        let place = Place(name: name, category: category, description: description, photo: photo, index: index)
                        
                        minskPlaces.append(place)
                    }
                }
                return minskPlaces
            }
        }
        return []
    }
    
    
    
}
