//
//  BasicCardView.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import UIKit

class BasicCardView: UIView {
    
    @IBOutlet weak var titleView: TitleView!
    @IBOutlet weak var priceView: PriceView!
    @IBOutlet weak var imageView: UIImageView!
    
    
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
        self.layer.borderColor = UIColor.darkGray.cgColor                
    }
    
    func configure(with model: BasicCardViewUIModel?) {
        guard let model = model else { return }
        
        do {
            let url = URL(string: model.image)
            let data = try Data(contentsOf: url!)
            imageView.image = UIImage(data: data)
        }
        catch {
            print("Image Error")
        }
        titleView.configure(with: model.titleModel)
        priceView.configure(with: model.priceModel)
    }
}
