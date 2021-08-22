//
//  LoginViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import Foundation
import Firebase

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate? { get set }
    func login()
}

protocol LoginViewModelDelegate: AnyObject {
    var emailValue: String { get }
    var passwordValue: String { get }
    func present(data: UIAlertController)
    func present(data: CustomTabbarViewController)
}

final class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
    func LoginUser() {
        guard let email = delegate?.emailValue, !email.isEmpty,
              let password = delegate?.passwordValue, !password.isEmpty else {
                print("Missing field data")
                return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {result, error in
            guard error == nil else {
                //show account creation
                let dialogMessage = UIAlertController(title: "Hata", message: "Üye bulunamadı.", preferredStyle: .alert)
                        // Present alert to user
                self.delegate!.present(data: dialogMessage)
                        
                        let when = DispatchTime.now() + 2
                        DispatchQueue.main.asyncAfter(deadline: when){
                          // your code with delay
                        dialogMessage.dismiss(animated: true, completion: nil)
                        }
                return
            }
            
            print("You have signed in")
            let customTabbar = UIStoryboard(name: "CustomTabbar", bundle: nil).instantiateViewController(identifier: "CustomTabbarViewController") as! CustomTabbarViewController
            self.delegate!.present(data: customTabbar)
            
            
            
        })
    }
     
}

extension LoginViewModel: LoginViewModelProtocol {
    func login() {
        LoginUser()
    }
    
    
}
