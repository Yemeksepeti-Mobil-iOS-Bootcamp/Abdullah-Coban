//
//  CityCell.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var cityImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var famous: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(city: CityModel) {
        cityImg.image = UIImage(named: city.cityImg)
        name.text = city.name
        famous.text = city.famous
    }
}
