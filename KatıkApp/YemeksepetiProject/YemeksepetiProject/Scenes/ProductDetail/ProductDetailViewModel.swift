//
//  ProductDetailViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 11.08.2021.
//

import UIKit
import CoreData
import Firebase

protocol ProductDetailViewModelProtocol {
    var delegate: ProductDetailViewModelDelegate? { get set }
    var product: Product { get }
    var id: Int { get set }
    func calculate(count: Int)
    func addProductToBasket()
}

protocol ProductDetailViewModelDelegate: AnyObject {
    var priceLabel: String { get set }
    var countLabel: String { get }
    var titleLbl: String { get }
}

final class ProductDetailViewModel {
    
    weak var delegate: ProductDetailViewModelDelegate?
    var userId = Auth.auth().currentUser?.uid
    var id: Int = 0
    
    func getProduct(id: Int) -> Product? {
        
        let urlStr = "https://yemeksepetibackend20210801094642.azurewebsites.net/api/Product/GetProductWithId?id=\(id)"

        guard let url = URL(string: urlStr) else {
            fatalError("Invalid URL")
        }
        
        let product = try? JSONDecoder().decode(Product.self, from: Data(contentsOf: url))
        
        guard let product = product else { fatalError("No Data") }
                
        return product
    }
    
    func addBasket(model: ProductDetail) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketProduct")
        let predicate = NSPredicate(format: "productName == '\(model.productName)'")
        fetchRequest.predicate = predicate
        let result = try? context.fetch(fetchRequest)
        if(result?.count != 0) {
            let resultData = result![0] as! NSManagedObject
            let count = resultData.value(forKey: "count")! as! Int + model.count
            let price = resultData.value(forKey: "price")! as! Int + model.price
            resultData.setValue(count, forKey: "count")
            resultData.setValue(price, forKey: "price")
            do {
                try context.save()
                print("Record Updated!")
                } catch
                {
                    print("Update Error")
                }
        } else {
            let favoriteItem = NSEntityDescription.insertNewObject(forEntityName: "BasketProduct", into: context)
            favoriteItem.setValue(model.id, forKey: "id")
            favoriteItem.setValue(model.userId, forKey: "userId")
            favoriteItem.setValue(model.price, forKey: "price")
            favoriteItem.setValue(model.count, forKey: "count")
            favoriteItem.setValue(model.productName, forKey: "productName")
            
            do {
                try context.save()
                print("Added record!")
            } catch  {
                print("Kaydedilemedi...")
            }
        }
    }
    
    private func calculatePrice(count: Int)
    {
        delegate!.priceLabel = String(count * product.price)
    }
    
    private func addToBasket() {
        let model = ProductDetail(id: product.id, userId: 2, price: Int(delegate!.priceLabel)!, count: Int(delegate!.countLabel)!, productName: delegate!.titleLbl)
        addBasket(model: model)
    }
        
    
}

extension ProductDetailViewModel: ProductDetailViewModelProtocol {
    func addProductToBasket() {
        addToBasket()
    }
    
    func calculate(count: Int) {
        calculatePrice(count: count)
    }
    
    
    var product: Product {
        getProduct(id: id)!
    }
    
    
}
