//
//  CityViewController.swift
//  Week-2
//
//  Created by Kerim Caglar on 27.06.2021.
//

import UIKit

class CityViewController: UIViewController {

    //var cities = ["Adana", "Adıyaman", "Afyon", "Ağrı", "Amasya"]
    //var famous = ["Kebap","Tütün","Kaymak","Dağ","Elma"]
    var cities = [CityModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cities.append(CityModel(cityImg: "kolonya", name: "Balıkesir", famous: "Kolonya"))
        cities.append(CityModel(cityImg: "boyoz", name: "İzmir", famous: "Boyoz"))
        cities.append(CityModel(cityImg: "manti", name: "Kayseri", famous: "Mantı"))
    }
}

extension CityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as! CityCell
        /*cell.textLabel?.text = cities[indexPath.row].name
        cell.detailTextLabel?.text = cities[indexPath.row].famous*/
        /*cell.cityImg.image = UIImage(named: cities[indexPath.row].cityImg)
        cell.name.text = cities[indexPath.row].name
        cell.famous.text = cities[indexPath.row].famous*/
        cell.configure(city: cities[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row + 1) nolu satıra tıkladım")
        print("\(cities[indexPath.row].name) seçildi")
        let alertController = UIAlertController(title: "\(cities[indexPath.row].name)", message: "\(cities[indexPath.row].famous)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
