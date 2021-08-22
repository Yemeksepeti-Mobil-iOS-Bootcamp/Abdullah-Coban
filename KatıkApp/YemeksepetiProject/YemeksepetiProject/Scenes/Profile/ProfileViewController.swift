//
//  ProfileViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 21.08.2021.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var viewModel: ProfileViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.8353, green: 0.2353, blue: 0.1451, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor.white;
        viewModel = ProfileViewModel()
        configureData()
    }
    
    func configureData() {
        nameLabel.text = viewModel.profile.Name
        surnameLabel.text = viewModel.profile.Surname
        addressLabel.text = viewModel.profile.Address
        phoneLabel.text = viewModel.profile.Phone
    }
}

extension ProfileViewController: ProfileViewModelDelegate {
    
}
