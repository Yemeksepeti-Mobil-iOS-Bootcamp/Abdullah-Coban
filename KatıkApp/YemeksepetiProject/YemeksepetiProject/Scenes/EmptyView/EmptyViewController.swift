//
//  EmptyViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 17.08.2021.
//

import UIKit

class EmptyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segueProductView(_ sender: Any) {
        performSegue(withIdentifier: "CustomTabbar", sender: nil)
    }
    
    
    
}
