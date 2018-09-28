import UIKit

class CategoryCell: UICollectionViewCell {
    // why init should be overriden?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // creating collection view inside category cell
    let placesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.blue
        return collectionView
    }()
    
    func setupView() {
        backgroundColor = UIColor.black
        
        addSubview(placesCollectionView)
        
    }
}
