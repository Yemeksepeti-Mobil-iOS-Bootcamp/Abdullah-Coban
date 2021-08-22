//
//  BasketViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 14.08.2021.
//

import UIKit
import CoreData
import Firebase

protocol BasketViewModelProtocol {
    var delegate: BasketViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    func load()
    func postOrder()
    func removeFromCoreData(id: Int, indexPath: IndexPath)
    func basket(indexPath: Int) -> Basket?
}

protocol BasketViewModelDelegate: AnyObject {
    func reloadData()
    var noteText: String { get }
    var totalPrice: String { get set }
    func present(data: EmptyViewController)
    func beginUpdates()
    func endUpdates()
    func deleteRows(indexPath: IndexPath)
}



final class BasketViewModel {
    
    var basket = [Basket]()
    var userId = Auth.auth().currentUser?.uid
    weak var delegate: BasketViewModelDelegate?
    
    private func getProductsOnBasket() {
        basket.removeAll()
        var totalPrice = 0
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketProduct")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let id = result.value(forKey: "id") as? Int else { return }
                    guard let userId = result.value(forKey: "userId") as? Int else { return }
                    guard let count = result.value(forKey: "count") as? Int else { return }
                    guard let price = result.value(forKey: "price") as? Int else { return }
                    guard let productName = result.value(forKey: "productName") as? String else { return }
                    self.basket.append(Basket(id: id, userId: userId, count: count, price: price, productName: productName))
                }
                for product in basket {
                    totalPrice += product.price
                }
                self.delegate?.totalPrice = String(totalPrice)
                self.delegate?.reloadData()
            } else {
                
            }
        } catch {
            print("Error")
        }
    }
    
    private func PostOrderAction(post: PostOrder) {
        let encoder = JSONEncoder()
        let url = URL(string: "https://yemeksepetibackend20210801094642.azurewebsites.net/api/Order/Add")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? encoder.encode(post)
        request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                guard let data = data else {return}
                do{
                    let todoItemModel = try JSONDecoder().decode(PostOrder.self, from: data)
                    print(todoItemModel)
                }catch let jsonErr{
                    print(jsonErr)
               }
         
        }
        task.resume()
    }
    
    func PostOrderOperations() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketProduct")
        let result = try? context.fetch(fetchRequest)
        
        if(result?.count != 0) {
            var entry = productList(productId: 0, productCount: 0)
            var productList = [productList]()
            for data in result as! [NSManagedObject] {
                entry.productCount = data.value(forKey: "count") as! Int
                entry.productId = data.value(forKey: "id") as! Int
                productList.append(entry)
            }
            let postOrder = PostOrder(orderNote: self.delegate!.noteText, productList: productList, userId: userId!)
            PostOrderAction(post: postOrder)
            
            for item in result! {
                guard let itemData = item as? NSManagedObject else {continue}
                context.delete(itemData)
            }
            do {
                try context.save()
                self.basket.removeAll()
                self.delegate?.reloadData()
                self.delegate?.totalPrice = "0"
                
                let emptyVC = UIStoryboard(name: "EmptyView", bundle: nil).instantiateViewController(identifier: "EmptyView") as! EmptyViewController
                //present(emptyVC, animated: true, completion: nil)
                delegate?.present(data: emptyVC)
                
                print("Record Updated!")
                } catch
                {
                    print("Update Error")
                }
        }
    }
    
    func RemoveFromCoreData(id: Int, indexPath: IndexPath) {
        var totalPrice = 0
        delegate?.beginUpdates()
        self.basket.remove(at: indexPath.row)
        delegate?.deleteRows(indexPath: indexPath)
        delegate?.endUpdates()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketProduct")
        let predicate = NSPredicate(format: "id == \(id)")
        fetchRequest.predicate = predicate
        let result = try? context.fetch(fetchRequest)
        let resultData = result as! [NSManagedObject]

           for object in resultData {
                context.delete(object)
           }

           do {
               try context.save()
                for product in self.basket {
                    totalPrice += product.price
                }
                self.delegate?.totalPrice = String(totalPrice)
                self.delegate?.reloadData()
               print("saved!")
           } catch let error as NSError  {
               print("Could not save \(error), \(error.userInfo)")
           }
    }
}

extension BasketViewModel: BasketViewModelProtocol {
    func removeFromCoreData(id: Int, indexPath: IndexPath) {
        RemoveFromCoreData(id: id, indexPath: indexPath)
    }
    
    func postOrder() {
        PostOrderOperations()
    }
    
    var numberOfItems: Int {
        basket.count
    }
    
    func load() {
        getProductsOnBasket()
    }
    
    func basket(indexPath: Int) -> Basket? {
        basket[safe: indexPath]
    }
    
    
}
