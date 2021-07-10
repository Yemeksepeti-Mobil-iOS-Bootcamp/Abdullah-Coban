//
//  NotificationSenderVC.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    var notificationData: [String: Any] = [:]
    
    @IBOutlet weak var notificationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK: Gönderilecek Data Kullanıcıdan Alınsın...
    //MARK: frame vs bound farkı nedir? Açıklayınız..

    @IBAction func sendNotificationBtn(_ sender: Any) {
        
        notificationData["name"] = notificationTextField.text
        
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: notificationData)
        dismiss(animated: true, completion: nil)
    }
    
}
