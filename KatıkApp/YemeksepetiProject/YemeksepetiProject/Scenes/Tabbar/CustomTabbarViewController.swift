//
//  CustomTabbarViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 15.08.2021.
//

import UIKit

class CustomTabbarViewController: UITabBarController, UITabBarControllerDelegate, UIViewControllerTransitioningDelegate {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
   }
}
