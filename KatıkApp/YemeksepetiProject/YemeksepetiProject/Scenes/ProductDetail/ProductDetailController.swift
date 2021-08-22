//
//  ProductDetailController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 11.08.2021.
//

import UIKit

class ProductDetailController: UIViewController {
    
    
 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productCount: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var id: Int = 0
    
    var viewModel: ProductDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = ProductDetailViewModel()
        viewModel.id = id
        configure(product: viewModel.product)
        
    }

    private func configure(product: Product) {
        titleLabel.text = product.productName
        productPrice.text = String(product.price)
        do {
            let url = URL(string: product.image)
            let data = try Data(contentsOf: url!)
            productImg.image = UIImage(data: data)
        }
        catch {
            print("Image Error")
        }
        
    }
    @IBAction func addBasket(_ sender: Any) {
        
        viewModel.addProductToBasket()
        
        // Create a new alert
        let dialogMessage = UIAlertController(title: "Başarılı!", message: "Ürün sepete eklendi.", preferredStyle: .alert)
        // Present alert to user
        self.present(dialogMessage, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
        dialogMessage.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func productCountStepper(_ sender: UIStepper) {
        productCount.text = String(Int(sender.value))
        viewModel.calculate(count: Int(sender.value))
    }
    
    
}

extension ProductDetailController: ProductDetailViewModelDelegate {
    var titleLbl: String {
        self.titleLabel.text!
    }
    
    
    
    var countLabel: String {
        self.productCount.text!
    }
    
    var priceLabel: String {
        get {
            self.productPrice.text!
        }
        set {
            productPrice.text = newValue
        }
    }
    
    
}
