//
//  OrdersViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 19.08.2021.
//

import Foundation
import Firebase

protocol OrdersViewModelProtocol {
    var delegate: OrdersViewModelDelegate? { get set }
    var orders: [Order] { get }
    var numberOfItems: Int { get }
    func load()
}

protocol OrdersViewModelDelegate: AnyObject {
    func registerCell()
    func reloadData()
}

class OrdersViewModel: OrdersViewModelProtocol {
    
    weak var delegate: OrdersViewModelDelegate?
    
    var orders: [Order] {
        getOrders()
    }
    
    var numberOfItems: Int {
        orders.count
    }
    
    func load() {
        delegate?.registerCell()
        delegate?.reloadData()
    }
    
    private func getOrders() -> [Order] {
        
        let userId = Auth.auth().currentUser?.uid
        let urlStr = "https://yemeksepetibackend20210801094642.azurewebsites.net/api/Order/GetOrders?userId=\(String(describing: userId!))"

        guard let url = URL(string: urlStr) else {
            fatalError("Invalid URL")
        }
        
        let orderList = try? JSONDecoder().decode([Order].self, from: Data(contentsOf: url))
        
        guard let orders = orderList else { fatalError("No Data") }
                
        return orders
    }
    
    
}
