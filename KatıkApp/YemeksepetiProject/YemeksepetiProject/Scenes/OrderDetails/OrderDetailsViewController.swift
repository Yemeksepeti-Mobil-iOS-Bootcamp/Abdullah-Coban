//
//  OrderDetailsViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 19.08.2021.
//

import UIKit


class OrderDetailsViewController: UIViewController {
    
    var orderDetails = [OrderDetails]()
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var id: Int = 0
    
    var viewModel: OrderDetailsViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.8353, green: 0.2353, blue: 0.1451, alpha: 1.0)
        viewModel = OrderDetailsViewModel()
        viewModel.id = id
        setupTableView()
        totalPriceLabel.text = String(viewModel.calculate()) + "₺"
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "BasketCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BasketCell")
    }
    
}
    

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as? BasketCell
        let productList = viewModel.order[indexPath.item]
        let model = BasketUIModel(productName: productList.productName, count: String(productList.count), price: String(productList.price))
        cell?.configure(basket: model)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
       
    
}

extension OrderDetailsViewController: OrderDetailsViewModelDelegate {
    
}
