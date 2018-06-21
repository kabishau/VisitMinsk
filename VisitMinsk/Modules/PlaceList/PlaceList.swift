import UIKit

class PlaceListViewController: UIViewController {
    
   var images = ["1_Church_Of_Sains_Simon_and_Helena_visit_in", "2_Church_Of_Sains_Simon_and_Helena_visit_in", "3_Church_Of_Sains_Simon_and_Helena_visit_in", "4_Church_Of_Sains_Simon_and_Helena_visit_in", "5_Church_Of_Sains_Simon_and_Helena_visit_in"]
    
    var categories = ["Visit in the City", "Visit outside the City", "Food"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


extension PlaceListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(categories[section])"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlaceCategoryTableViewCell
        
        return cell

    }
}

extension PlaceListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! PlaceCollectionViewCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
}


class PlaceCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
}

class PlaceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
}
