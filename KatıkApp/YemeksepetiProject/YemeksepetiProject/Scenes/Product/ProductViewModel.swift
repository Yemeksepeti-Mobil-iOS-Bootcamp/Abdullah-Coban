//
//  ProductViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 8.08.2021.
//

import Foundation

protocol ProductViewModelProtocol {
    var delegate: OOSAndStockDaySelectionViewModelDelegate? { get set }
    var products: [Product] { get }
    var numberOfItems: Int { get }
    func load()
    var selectedCategory: Int { get set }
}

protocol OOSAndStockDaySelectionViewModelDelegate: AnyObject {
    func registerCell()
    func reloadData()
}
class ProductViewModel: ProductViewModelProtocol {
    
    var selectedCategory: Int = 0
    
    weak var delegate: OOSAndStockDaySelectionViewModelDelegate?
    
    var products: [Product] {
        if selectedCategory != 0 {
            return getProducts(id: selectedCategory)
        } else {
            return getProducts()
        }        
    }
    
    var numberOfItems: Int {
        products.count
    }
    
    func load() {
        delegate?.registerCell()
        delegate?.reloadData()
    }
    
    private func getProducts(id: Int? = nil) -> [Product] {
        
        var urlStr = "https://yemeksepetibackend20210801094642.azurewebsites.net/api/Product/GetProducts"
        
        if id != nil {
            urlStr = "https://yemeksepetibackend20210801094642.azurewebsites.net/api/Product/GetProductsWithCategoryId?id=\(id!)"
        }
        
        guard let url = URL(string: urlStr) else {
            fatalError("Invalid URL")
        }
        
        let productList = try? JSONDecoder().decode([Product].self, from: Data(contentsOf: url))
        
        guard let products = productList else { fatalError("No Data") }
                
        return products
    }
    
    
}
