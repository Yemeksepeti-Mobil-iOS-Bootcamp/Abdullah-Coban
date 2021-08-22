//
//  RegisterViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import UIKit


class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    
    var viewModel: RegisterViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegisterViewModel()
    }
    
    
    
    @IBAction func Register(_ sender: Any) {
        viewModel.register()
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func present(data: UIAlertController) {
        self.present(data, animated: true, completion: nil)
    }
    
    func present(data: CustomTabbarViewController) {
        self.present(data, animated: true, completion: nil)
    }
    
    var emailValue: String {
        self.mailText.text!
    }
    
    var passwordValue: String {
        self.passwordText.text!
    }
    
    var nameValue: String {
        self.nameText.text!
    }
    
    var surnameValue: String {
        self.surnameText.text!
    }
    
    var addressValue: String {
        self.addressText.text!
    }
    
    var phoneValue: String {
        self.phoneText.text!
    }
    
    
}
