//
//  LoginViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 20.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var viewModel: LoginViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
    }
    
    @IBAction func Login(_ sender: Any) {
        viewModel.login()
        

    }
}

extension LoginViewController: LoginViewModelDelegate {
    func present(data: CustomTabbarViewController) {
        self.present(data, animated: true, completion: nil)
    }
    
    func present(data: UIAlertController) {
        self.present(data, animated: true, completion: nil)
    }
    
    var emailValue: String {
        self.emailText.text!
    }
    
    var passwordValue: String {
        self.passwordText.text!
    }
    
    
}
