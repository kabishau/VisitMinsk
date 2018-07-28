import UIKit

var headerHeight: CGFloat = 24.0

class MainViewController: UIViewController {
    
    let dataSource = DataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initiation of stucture with local images
        // arrayOfObjects = [objectStruct.init(properties of the struct)

    }

}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        headerView.sectionNameLabel.text = dataSource.sections[section]
        
        return headerView
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SectionTableViewCell
        
        let places = dataSource.placesForSection(indexPath.section)
        cell.places = places
        
        
        return cell

    }
}

class SectionTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var places: [Place]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let places = places else { return 0 }
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        if let places = places {
            cell.imageView.image = UIImage(named: places[indexPath.item].photo)
            cell.titleLabel.text = places[indexPath.item].name
        }
        
        return cell
    }
    
    
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var place: Place? {
        didSet {
            if let place = place {
                imageView.image = UIImage(named: place.name)
                titleLabel.text = place.name
            }
        }
    }
    
    // do I really need this?
//    override func prepareForReuse() {
//        imageView.image = nil
//    }

}
