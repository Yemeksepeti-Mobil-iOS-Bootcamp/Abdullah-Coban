//
//  AccountViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 16.08.2021.
//

import UIKit


class AccountViewController: UIViewController {
    
    var accountViewModel: AccountViewModelProtocol! {
        didSet {
            accountViewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.8353, green: 0.2353, blue: 0.1451, alpha: 1.0)
        accountViewModel = AccountViewModel()
    }
    
    
    @IBAction func goOrdersBtn(_ sender: Any) {
        performSegue(withIdentifier: "Orders", sender: nil)
    }
    
    @IBAction func goProfileBtn(_ sender: Any) {
        performSegue(withIdentifier: "Profile", sender: nil)
    }
    
    @IBAction func LogOut(_ sender: Any) {
        accountViewModel.logOut()
    }
}

extension AccountViewController: AccountViewModelDelegate {
    func present(data: LoginViewController) {
        present(data, animated: true, completion: nil)
    }
    
    
    
    
}
