//
//  OrderDetailsViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 19.08.2021.
//

import Foundation

protocol OrderDetailsViewModelProtocol {
    var delegate: OrderDetailsViewModelDelegate? { get set }
    var order: [OrderDetails] { get }
    var numberOfItems: Int { get }
    func calculate() -> Int
    var id: Int { get set }
}

protocol OrderDetailsViewModelDelegate: AnyObject {
    
}

final class OrderDetailsViewModel {
    
    weak var delegate: OrderDetailsViewModelDelegate?
    
    var id: Int = 0
    
    private func getOrderDetails(id: Int) -> [OrderDetails] {
        
        let urlStr = "https://yemeksepetibackend20210801094642.azurewebsites.net/api/Order/GetOrderDetailWithId?orderId=\(id)"
        guard let url = URL(string: urlStr) else {
        fatalError("Invalid URL")
        }
        
        let orderList = try? JSONDecoder().decode([OrderDetails].self, from: Data(contentsOf: url))
        
        guard let orders = orderList else { fatalError("No Data") }
                
        return orders
    }
    
    private func calculatePrice () -> Int {
        var price = 0
        for item in order {
            price += item.price
        }
        
        return price
    }
}

extension OrderDetailsViewModel: OrderDetailsViewModelProtocol {
    
    var order: [OrderDetails] {
        getOrderDetails(id: id)
    }
    
    var numberOfItems: Int {
        order.count
    }
    
    func calculate() -> Int {
        return calculatePrice()
    }
}
