import Foundation

class PlaceGroup {
    
    var title: String
    var places: [Place]
    
    init(named: String, includePlaces: [Place]) {
        title = named
        places = includePlaces
    }
    
}
