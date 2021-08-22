//
//  RegisterViewModel.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import Foundation
import Firebase

protocol RegisterViewModelProtocol {
    var delegate: RegisterViewModelDelegate? { get set }
    func register()
}

protocol RegisterViewModelDelegate: AnyObject {
    var emailValue: String { get }
    var passwordValue: String { get }
    var nameValue: String { get }
    var surnameValue: String { get }
    var addressValue: String { get }
    var phoneValue: String { get }
    func present(data: UIAlertController)
    func present(data: CustomTabbarViewController)
}

final class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    
    private func registerUser() {
        guard let email = delegate?.emailValue, !email.isEmpty,
              let password = delegate?.passwordValue, !password.isEmpty,
              let name = delegate?.nameValue, !name.isEmpty,
              let surname = delegate?.surnameValue, !surname.isEmpty,
              let address = delegate?.addressValue, !address.isEmpty,
              let phone = delegate?.phoneValue, !phone.isEmpty else {
                print("Missing field data")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            guard error == nil else {
                print("Kayıt başarısız")
                return
            }
            let userId = Auth.auth().currentUser?.uid
            let model = RegisterModel(userID: userId!, username: email, password: password, name: name, surname: surname, phone: phone, address: address)
            self.AddUser(AddUser: model)
            
            let dialogMessage = UIAlertController(title: "Başarılı", message: "Kayıt tamamlandı.", preferredStyle: .alert)
            // Present alert to user
            self.delegate?.present(data: dialogMessage)
                    
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            dialogMessage.dismiss(animated: true, completion: nil)
            let customTabbar = UIStoryboard(name: "CustomTabbar", bundle: nil).instantiateViewController(identifier: "CustomTabbarViewController") as! CustomTabbarViewController
            self.delegate?.present(data: customTabbar)
            }
        }
    }
    
    private func AddUser(AddUser: RegisterModel) {
        let encoder = JSONEncoder()
        let url = URL(string: "https://yemeksepetibackend20210801094642.azurewebsites.net/api/User/Register")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? encoder.encode(AddUser)
        request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                guard let data = data else {return}
                do{
                    let todoItemModel = try JSONDecoder().decode(RegisterModel.self, from: data)
                    print(todoItemModel)
                }catch let jsonErr{
                    print(jsonErr)
               }
         
        }
        task.resume()
        
        
    }
}

extension RegisterViewModel: RegisterViewModelProtocol {
    func register() {
        registerUser()
    }
    

}
