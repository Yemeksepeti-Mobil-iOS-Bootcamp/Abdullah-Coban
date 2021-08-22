//
//  MenuCell.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var basicCardView: BasicCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: BasicCardViewUIModel) {
        basicCardView.configure(with: model)
    }
    
}
