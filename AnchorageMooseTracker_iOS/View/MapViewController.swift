//
//  MapViewController.swift
//  AnchorageMooseTracker_iOS
//
//  Created by Samuel Grosenick on 8/8/18.
//  Copyright © 2018 Samuel Grosenick. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    var marker = GMSMarker()
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 18.0
    let setLocationbtn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
    let locationInstruction = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
    
    
    override func viewDidLoad() {
        
        //show current location
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self as CLLocationManagerDelegate
        
        placesClient = GMSPlacesClient.shared()
        
        //create map
        let camera = GMSCameraPosition.camera(withLatitude: 61.172387, longitude: -149.873818, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        view = mapView
        
        //create Set Location button
        setLocationbtn.backgroundColor = Theme.tint
        setLocationbtn.setTitle("Set Location", for: .normal)
        setLocationbtn.setTitleColor(UIColor.white, for: .normal)
        setLocationbtn.setTitleColor(UIColor.lightGray, for: .highlighted)
        setLocationbtn.layer.cornerRadius = 10
        setLocationbtn.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        self.view.addSubview(setLocationbtn)
        
        setLocationbtn.translatesAutoresizingMaskIntoConstraints = false
        
        setLocationbtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        setLocationbtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        setLocationbtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        setLocationbtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        setLocationbtn.isHidden = true
        
        //create instruction label
        locationInstruction.font = UIFont(name: Theme.mainFontName, size: 17)
        locationInstruction.text = "Tap on map to set location"
        self.view.addSubview(locationInstruction)
        
        locationInstruction.translatesAutoresizingMaskIntoConstraints = false
        
        locationInstruction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        locationInstruction.widthAnchor.constraint(equalToConstant: 200).isActive = true
        locationInstruction.heightAnchor.constraint(equalToConstant: 40).isActive = true
        locationInstruction.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        
    }
    
    @objc func buttonPressed(sender: UIButton) {
        let latString: String = String(format: "%f", marker.position.latitude)
        let lonString: String = String(format: "%f", marker.position.longitude)
        print("Latitude: " + latString + ", Longitude: " + lonString)
        NotificationCenter.default.post(name: .mooseLocation, object: self)
    }
    
    //Allows user to add marker by tapping on the map
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        //Check to see if there already is a marker on the map
        if marker == marker {
            mapView.clear()
        }

        //Creates marker where map is tapped
        marker = GMSMarker(position: coordinate)
        marker.title = "Moose here!"
        marker.map = mapView
        locationInstruction.isHidden = true
        setLocationbtn.isHidden = false
        
   }
}

extension MapViewController: CLLocationManagerDelegate {
    //Handle incomeing location events
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
    }
    
    //Handle authorization for the location manager
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            //Display the map using default location
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print()
        }
    }
    
    //Handle location manager errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
    
}
