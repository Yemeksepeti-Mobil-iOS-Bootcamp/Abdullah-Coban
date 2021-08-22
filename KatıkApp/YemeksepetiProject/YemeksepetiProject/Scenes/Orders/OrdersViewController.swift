//
//  OrdersViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 18.08.2021.
//

import UIKit

class OrdersViewController : UIViewController, OrdersViewModelDelegate {
    
    private enum Constants {
        static let height: CGFloat = 180
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    var viewModel: OrdersViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.8353, green: 0.2353, blue: 0.1451, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.white;
        let backButton = UIBarButtonItem()
        backButton.title = "Hesabım"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        viewModel = OrdersViewModel()
        viewModel?.load()
    }
    
    func registerCell() {
        collectionView?.register(cellType: MenuCell.self)
    }
    
    func reloadData() {
        collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OrderDetails" ,
           let senderVC: OrderDetailsViewController = segue.destination as? OrderDetailsViewController {
            senderVC.id = sender as! Int
            }
       
    }
}


extension OrdersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfItems ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: MenuCell.self, indexPath: indexPath)
       
        guard let order = viewModel?.orders[indexPath.item] else {
            return .init()
        }
        
        let model = BasicCardViewUIModel(image: "https://cdn0.iconfinder.com/data/icons/work-from-home-17/512/FoodDelivery-food-delivery-meal-order-512.png", titleModel: TitleViewUIModel(title: order.orderDate, subTitle: order.status), priceModel: PriceViewUIModel(price: String(order.price)))
      
        cell.configure(with: model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: Constants.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.orders[indexPath.row].id)
        performSegue(withIdentifier: "OrderDetails", sender: viewModel.orders[indexPath.row].id)
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

