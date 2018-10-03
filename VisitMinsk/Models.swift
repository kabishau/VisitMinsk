import UIKit

class Category: NSObject {
    
    var name: String?
    var places: [Place]?
    
    static func sampleCategory() -> [Category] {
        
        let inCity = Category()
        inCity.name = "Visit in City"
        
        var inCityPlaces = [Place]()
        let nationalLibrary = Place()
        nationalLibrary.name = "National Library"
        nationalLibrary.imageName = "National Library"
        inCityPlaces.append(nationalLibrary)
        inCity.places = inCityPlaces
        
        let outsideCity = Category()
        outsideCity.name = "Visit Outside City"
        
        var outsideCityPlaces = [Place]()
        let stalinLine = Place()
        stalinLine.name = "Stalin Line"
        stalinLine.imageName = "Stalin Line"
        outsideCityPlaces.append(stalinLine)
        outsideCity.places = outsideCityPlaces
        
        
        
        return [inCity, outsideCity]
        
    }
}


class Place: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
}
