//
//  ViewController.swift
//  tabbar_example
//
//  Created by Abdullah Coban on 14.07.2021.
//
/*
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabbarConfig()
    }
    
    private func tabbarConfig() {
        guard let tabbar = tabBarController?.tabBar else { return }
        
        tabbar.barTintColor = .orange
        tabbar.tintColor = .white
        tabbar.unselectedItemTintColor = .black
        
        tabbar.layer.cornerRadius = 20
        tabbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabbar.layer.masksToBounds = true
    }
    
}
 */

import UIKit
class MyTabBarCtrl: UITabBarController, UITabBarControllerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
   }
    
    // TabBarButton – Setup Middle Button
        func setupMiddleButton() {

            let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
            
            
            //add to the tabbar and add click event
            self.tabBar.addSubview(middleBtn)
            middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

            self.view.layoutIfNeeded()
        }

        // Menu Button Touch Action
        @objc func menuButtonAction(sender: UIButton) {
            self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
        }
}




