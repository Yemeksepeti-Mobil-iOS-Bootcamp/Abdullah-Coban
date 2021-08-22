//
//  BasketCell.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 14.08.2021.
//

import UIKit

class BasketCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(basket: BasketUIModel) {
        
        productNameLabel.text = basket.productName
        countLabel.text = String(basket.count) + " adet"
        priceLabel.text = String(basket.price)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10))
    }
    
    
    
}
