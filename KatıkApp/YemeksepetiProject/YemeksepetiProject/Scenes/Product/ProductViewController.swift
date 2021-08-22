//
//  UserController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 4.08.2021.
//

import UIKit
import Alamofire
import Firebase

class ProductViewController: UIViewController, OOSAndStockDaySelectionViewModelDelegate {
    
    private enum Constants {
        static let height: CGFloat = 180
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: ProductViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            viewModel = ProductViewModel()
            viewModel?.load()
    }
    
    @IBAction func yiyecekBtn(_ sender: Any) {
        viewModel.selectedCategory = 1
        viewModel?.load()
    }
    
    @IBAction func icecekBtn(_ sender: Any) {
        viewModel.selectedCategory = 2
        viewModel?.load()
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        viewModel.selectedCategory = 3
        viewModel?.load()
    }
    
    @IBAction func logoBtn(_ sender: Any) {
        viewModel.selectedCategory = 0
        viewModel?.load()
    }
    
    func registerCell() {
        collectionView.register(cellType: MenuCell.self)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetail" ,
           let senderVC: ProductDetailController = segue.destination as? ProductDetailController {
                senderVC.id = sender as! Int
            }
       
    }
}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: MenuCell.self, indexPath: indexPath)
       
        guard let product = viewModel?.products[indexPath.item] else {
            return .init()
        }
        
        let model = BasicCardViewUIModel(image: product.image, titleModel: TitleViewUIModel(title: product.productName, subTitle: "Lezzetin Adresi"), priceModel: PriceViewUIModel(price: String(product.price)))
      
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: Constants.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.products[indexPath.row].id)
        performSegue(withIdentifier: "productDetail", sender: viewModel.products[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return sectionInset
    }
}






