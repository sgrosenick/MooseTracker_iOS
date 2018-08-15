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

    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    var marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up map
        let camera = GMSCameraPosition.camera(withLatitude: 61.165611, longitude: -149.880461, zoom: 10.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        self.view = mapView
        
        //set up location manager
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self as? CLLocationManagerDelegate
        
        placesClient = GMSPlacesClient.shared()
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        //Check to see if there already is a marker on the map
        if marker == marker {
            mapView.clear()
        }
        
        //Creates marker where map is tapped
        marker = GMSMarker(position: coordinate)
        marker.title = "Moose here!"
        marker.map = mapView
    }
}
