import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var imageArray = [String]()
    
    let imageArray = ["1_21", "1_21", "1_21", "1_21", "1_21", "1_21", "1_21", "1_21", "1_21", "1_21"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 120, height: 120)
        return size
    }

}


