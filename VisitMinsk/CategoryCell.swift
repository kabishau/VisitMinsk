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
    
    // label for category
    let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Visit In City"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.white
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false // not because of VFL, but why?
        return label
    }()
    
    let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: .normal)
        button.backgroundColor = .brown
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        
        backgroundColor = UIColor.gray
        
        addSubview(placesCollectionView)
        addSubview(categoryNameLabel)
        addSubview(seeAllButton)
        
        placesCollectionView.delegate = self
        placesCollectionView.dataSource = self
        
        // register collection view
        placesCollectionView.register(PlaceCell.self, forCellWithReuseIdentifier: placeCellId)
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let views: [String: Any] = [
            "categoryNameLabel": categoryNameLabel,
            "seeAllButton": seeAllButton,
            "placesCollectionView": placesCollectionView
        ]
        
        let categoryNameVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[categoryNameLabel]-[placesCollectionView]-|",
            //options: [],
            metrics: nil,
            views: views)
        allConstraints += categoryNameVerticalConstraints
        
        let categoryNameHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-14-[categoryNameLabel]-40-[seeAllButton]-14-|",
            //options: [],
            metrics: nil,
            views: views)
        allConstraints += categoryNameHorizontalConstraints
        
        let placesCollectionViewHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[placesCollectionView]|",
            //options: [],
            metrics: nil,
            views: views)
        allConstraints += placesCollectionViewHorizontalConstraints

        NSLayoutConstraint.activate(allConstraints)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: placeCellId, for: indexPath) as! PlaceCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // don't need to specify the view in height because it's in collection view cell and it has frame property
        return CGSize(width: 190, height: 170) // this is supposed to give a space for category label
    }
    
    // margins for collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLreayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
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
    
    // image thumb for place cells
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "National Library")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16 // it looks like corner radius work only with .scaleAspectFill contentMode
        imageView.layer.masksToBounds = true // require to make corner radius happen
        return imageView
    }()
    
    // title for the place cell
    let placeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "National Library"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    func setupView() {
        backgroundColor = UIColor.black
        
        addSubview(imageView)
        // it's easier to specify size and position this way instead of constraints
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        
        addSubview(placeNameLabel)
        placeNameLabel.frame = CGRect(x: 0, y: frame.height - 60, width: frame.width, height: 60)
    }
}
