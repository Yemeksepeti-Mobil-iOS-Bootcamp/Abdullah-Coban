//
//  NewsCell.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDetail: UILabel!
    
    func configure(news: NewsModel) {
        newsImg.image = news.image
        newsTitle.text = news.title
        newsDetail.text = news.detail
    }
}
