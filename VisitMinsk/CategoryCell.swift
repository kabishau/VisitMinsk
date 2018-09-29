import UIKit

private let placeCellId = "PlaceCellId"

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        
        // makes visual language constraints work
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupView() {
        backgroundColor = UIColor.clear
        
        addSubview(placesCollectionView)
        
        placesCollectionView.delegate = self
        placesCollectionView.dataSource = self
        
        // register collection view
        placesCollectionView.register(PlaceCell.self, forCellWithReuseIdentifier: placeCellId)
        
        // constraints with visual language ("H:|-18-[v0]-18-|" - with values, and "H:|[v0]|", "V:|[v0]|" without values)
        let views = ["view": placesCollectionView]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[view]-14-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: placeCellId, for: indexPath) as! PlaceCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // don't need to specify the view in height because it's in collection view cell and it has frame property
        return CGSize(width: 150, height: frame.height)
    }
}

class PlaceCell: UICollectionViewCell {
    
    // why init should be overriden?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.black
    }
}
