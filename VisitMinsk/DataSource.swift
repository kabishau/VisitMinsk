import Foundation
/*
class DataSource {
    
    var places = [Place]()
    var sections = [String]()
    
    var count: Int {
        return places.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        places = loadPlacesFromDisk()
    }
    

    
//    func placeForItemAtIndexPath(_ indexPath: IndexPath) -> Place? {
//        if indexPath.section > 0 {
//            let minskPlaces = placesForSection(indexPath.section)
//            return minskPlaces[indexPath.item]
//        } else {
//            return places[indexPath.item]
//        }
//    }
    
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
                        
                        // appending sections array with unique values
                        if !sections.contains(category) {
                            sections.append(category)
                        }
                        
                        minskPlaces.append(place)
                    }
                }
                return minskPlaces
            }
        }
        return []
    }
    
    func placesForSection(_ index: Int) -> [Place] {
        let section = sections[index]
        let placesInSection = places.filter { (place: Place) -> Bool in
            return place.category == section
        }
        return placesInSection
    }
    
    func numberOfPlacesForSection(_ index: Int) -> Int {
        let minskPlaces = placesForSection(index)
        return minskPlaces.count
    }
    
    
    
}
*/
