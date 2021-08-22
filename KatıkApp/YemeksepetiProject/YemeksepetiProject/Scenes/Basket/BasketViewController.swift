//
//  BasketViewController.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 14.08.2021.
//

import UIKit
import Firebase

class BasketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UITextField!
    @IBOutlet weak var orderButton: UIButton!
    
    var basketViewModel: BasketViewModelProtocol! {
        didSet {
            basketViewModel.delegate = self
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.8353, green: 0.2353, blue: 0.1451, alpha: 1.0)
        setupTableView()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        basketViewModel = BasketViewModel()
        basketViewModel?.load()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "BasketCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BasketCell")
    }
    
    @IBAction func postOrder(_ sender: Any) {
        basketViewModel.postOrder()
    }
}


extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if basketViewModel.numberOfItems == 0 {
            tableView.setEmptyView(title: "SEPETİNİZ BOŞ", message: "Sepetinizde ürün bulunmamaktadır.")
            orderButton.isEnabled = false
        } else {
            tableView.restore()
            orderButton.isEnabled = true
        }
        
        return basketViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as? BasketCell
        let basketList = basketViewModel.basket(indexPath: indexPath.row) //basket[indexPath.item]
        let model = BasketUIModel(productName: basketList!.productName, count: String(basketList!.count), price: String(basketList!.price))
        cell?.configure(basket: model)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let id = basketViewModel.basket(indexPath: indexPath.row)!.id //[indexPath.row].id
            let alert = UIAlertController(title: "", message: "Ürünü sepetinizden çıkarmak istediğinize emin misiniz?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: { (action) -> Void in }))
            alert.addAction(UIAlertAction(title: "Sil", style: .destructive, handler: { [self] (action) -> Void in
                
                basketViewModel.removeFromCoreData(id: id, indexPath: indexPath)
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
       
    
}

extension BasketViewController: BasketViewModelDelegate {
    func deleteRows(indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func beginUpdates() {
        tableView.beginUpdates()
    }
    
    func endUpdates() {
        tableView.endUpdates()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    var noteText: String {
        noteTextLabel.text!
    }
    
    var totalPrice: String {
        get {
            totalPriceLabel.text!
        }
        set {
            totalPriceLabel.text = newValue
        }
    }
    
    func present(data: EmptyViewController) {
        present(data, animated: true, completion: nil)
    }
    
        
}
