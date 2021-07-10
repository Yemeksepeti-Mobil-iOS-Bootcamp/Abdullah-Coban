//
//  ViewController.swift
//  Week-2
//
//  Created by Kerim Caglar on 26.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var SwitchBtn: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*let frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 400)
        let label = UILabel(frame: frame)
        label.backgroundColor = .red
        label.text = "Merhaba nasılsınız? Hoşgeldiniz. Hava orda da sıcak mı? Bazı yerlerde dolu haberi varmış?"*/
        //label.textColor = .white
        //label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //label.font = UIFont(name: "Avenir", size: 30)
        //label.font = .boldSystemFont(ofSize: 30)
        /*label.numberOfLines = 0
        view.addSubview(label)*/
        //Buton ile ilgili Özelleştirmeler
        /*saveButton.isHidden = false
        saveButton.isEnabled = true
        saveButton.setTitle("Kaydet", for: .normal)
        saveButton.setTitleColor(.red, for: .normal)*/
        
        SwitchBtn.addTarget(self, action: #selector(switchChangeValue(switchState:)), for: .valueChanged)
        
        //MARK: segmented controll ilk başta tıklandığında ilk segmentin aksiyonunu almaya çalışınız.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //???
    }
    
    @IBAction func changeWelcomeLbl(_ sender: Any) {
        let name = nameTextField.text
        welcomeLbl.text = "Merhaba, hoşgeldin \(name ?? "")"
        nameTextField.text = ""

    }
    
    @IBAction func tappedSegmented(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("İlk Segment Seçildi")
        case 1:
            print("İkinci Segment Seçildi")
        default:
            break
        }
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let value = Int(sender.value)
        welcomeLbl.text = "\(value)"
    }
    
    @objc func switchChangeValue(switchState: UISwitch) {
        
        if switchState.isOn {
            welcomeLbl.text = "Ayarlar açıldı"
        } else {
            welcomeLbl.text = "Ayarlar kapatıldı"
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        welcomeLbl.text = Int(sender.value).description
    }
    
}

