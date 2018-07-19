import UIKit

class DetailViewController: UIViewController {
    
    var imageName: String!
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
    }
}
