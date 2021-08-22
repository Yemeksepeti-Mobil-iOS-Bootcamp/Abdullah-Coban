//
//  LabelWithImage.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import UIKit

class LabelWithImage: UIView {
    private enum Constants {
        static let radius: CGFloat = 4.0
    }
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageContainer: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        view.frame = self.bounds
        addSubview(view)
        setupUI()
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = Constants.radius
    }
    
    func configure(with model: LabelWithImageUIModel) {
        menuTitle.text = model.value
        menuImage.image = UIImage(named: model.path)
    }
    
    
    
}
