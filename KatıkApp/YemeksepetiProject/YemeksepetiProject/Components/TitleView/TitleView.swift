//
//  TitleView.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import UIKit

class TitleView: UIView {
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight,
                                                          .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
    }
    
    func configure(with model: TitleViewUIModel) {
        productLabel.text = model.title
        detailLabel.text = model.subTitle
        iconImage.image = UIImage(named: "subMenu")
    }
    
    
}
