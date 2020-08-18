import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpObject(object: CityModel) {
        shortNameLabel.text = object.country
        titleLabel.text = object.name
        subtitleLabel.text = "latitude: \(object.coord.lat), longtitude: \(object.coord.lon)"
    }
}
