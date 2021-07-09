//
//  ViewController.swift
//  hw_map
//
//  Created by Abdullah Coban on 8.07.2021.
//

//MARK: Harita uygulamasında tam adresinizi belirleyecek pinleme yapınız.

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        checkLocationServices()
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //haritanın ortasında gösterme mavi nokta
    func showUserLocationCenterMap() {
        //kullanıcının koordinatlarına ulaşma
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    //kullanıcı izni var mı yok mu
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //Kullanıcıya ayarlardan konum servisini açması istenebilir.
        }
    }
    
    func checkLocationAuthorization() {
        //plist ten izin ekledik.
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            /*mapView.showsUserLocation = true
            showUserLocationCenterMap() //kullanıcının yerini harita ortasında gösterme
            locationManager.startUpdatingLocation()*/
        //pinlemeden sonra
        trackingLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            break
        case .restricted:
            break
        }
    }
    
    //kullanıcının yolunu izleme pinlenen yeri izle
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    //sürekli takip ederken bu fonksiyon kullanılacak
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
 

}


extension MapViewController: CLLocationManagerDelegate {
    
    //Pinleme sonrası buraya ihtiyaç yok
    
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
    }*/
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
    
}


extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder() //Enlem-boylamı adrese çeviriyor
    
        guard let lastLocation = lastLocation else { return }
    
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            let countryCode = placemark.isoCountryCode ?? "CountryCode"
            let subThoroughfare = placemark.subThoroughfare ?? "subStreet"
            let postalCode = placemark.postalCode ?? "Postal Code"
            let administrativeArea = placemark.administrativeArea ?? ""
            let subLocality = placemark.subLocality ?? ""
            
            self.addressLabel.text = "\(countryCode), \(administrativeArea), \(postalCode) - \(city), \(subLocality) - \(street), No: \(subThoroughfare)"
            
            
        }
        
    
    }
    
}
