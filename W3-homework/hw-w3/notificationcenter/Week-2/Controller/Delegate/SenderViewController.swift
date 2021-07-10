//
//  SenderViewController.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

protocol MessageDelegate: AnyObject {
    func sendMessage(updateLabel text:String)
}

class SenderViewController: UIViewController {

    @IBOutlet weak var msgTextField: UITextField!
    weak var delegate : MessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        guard let text = msgTextField.text else { return }
        delegate?.sendMessage(updateLabel: text)
        dismiss(animated: true, completion: nil)
    }

}
