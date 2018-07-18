import UIKit
import MapKit

class MapViewCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
