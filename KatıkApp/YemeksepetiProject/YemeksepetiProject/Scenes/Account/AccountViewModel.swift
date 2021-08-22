//
//  AccountViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import Foundation
import CoreData
import Firebase

protocol AccountViewModelProtocol {
    var delegate: AccountViewModelDelegate? { get set }
    func logOut()
}

protocol AccountViewModelDelegate: AnyObject {
    func present(data: LoginViewController)
}

final class AccountViewModel {
    
    weak var delegate: AccountViewModelDelegate?
    
    func LogOut() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            deleteCoreData()
            let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(identifier: "Login") as! LoginViewController
            delegate?.present(data: loginVC)
        } catch {
            print("An error occurred")
        }
    }
    
    private func deleteCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketProduct")
        let result = try? context.fetch(fetchRequest)
        if(result?.count != 0) {
            for item in result! {
                guard let itemData = item as? NSManagedObject else {continue}
                context.delete(itemData)
            }
            do {
                try context.save()
                print("Record Updated!")
                } catch
                {
                    print("Update Error")
                }
        }
    }
    
}

extension AccountViewModel: AccountViewModelProtocol {
    func logOut() {
        LogOut()
    }
}
