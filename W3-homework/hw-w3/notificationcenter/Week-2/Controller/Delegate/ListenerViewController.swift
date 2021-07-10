//
//  ListenerViewController.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class ListenerViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getDataBtn(_ sender:Any) {
        
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SenderVC") as! SenderViewController
        
        senderVC.delegate = self
        
        present(senderVC, animated: true, completion: nil)
        
    }

}

extension ListenerViewController: MessageDelegate {

    func sendMessage(updateLabel text: String) {
        messageLabel.text = text
    }
    
}
