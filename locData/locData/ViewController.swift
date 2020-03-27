//
//  ViewController.swift
//  locData
//
//  Created by Kadin Mesriani on 3/27/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
@IBOutlet weak var mapView: MKMapView!
@IBOutlet weak var label: UILabel!
    
var locationManager: CLLocationManager!
let CROSSROADS_LAT = 34.033340
let CROSSROADS_LONG = -118.501579
        
override func viewDidLoad() {
    super.viewDidLoad()
            
// Set up the CLLocationManager
locationManager = CLLocationManager()
locationManager.delegate = self
locationManager.requestWhenInUseAuthorization()
// Set the delegate for the MKMapView
mapView.delegate = self
// Set the initial region for the MKMapView
let crossroadsCoord = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
let point = MKMapPoint(crossroadsCoord)
let size = MKMapSize(width: 1000, height: 1000)
let rect = MKMapRect(origin: point, size: size)
mapView.setRegion(MKCoordinateRegion(rect), animated: true)
}

   
@IBAction func zoomOut(_ sender: Any) {
    changeZoom(1)
}
    
@IBAction func zoomIn(_ sender: Any) {
    changeZoom(-1)
}
    
func changeZoom(_ exp: Double) {
    let region = mapView.region
    let newLat = region.span.latitudeDelta * pow(2, exp)
    let newLong = region.span.longitudeDelta * pow(2, exp)
    let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
    let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
}
        
@IBAction func findMeNow(_ sender: Any) {
    locationManager.requestLocation()
}
        
// MARK: Implement the MKMapViewDelegate protocol's methods
// Check if we're at Crossroads right now
    
func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    let rect = mapView.visibleMapRect
    let crossroadsLoc = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
    let crossroadsPoint = MKMapPoint(crossroadsLoc)
    if rect.contains(crossroadsPoint) {
        label.text = "You are here."
        } else {
        label.text = "I don't know where you are yet..."
        }
}
        
     
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let span = mapView.region.span
    let coords = locations.suffix(1)[0].coordinate
    let newRegion = MKCoordinateRegion(center: coords, span: span)
    mapView.setRegion(newRegion, animated: true)
}
     
func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
}
        
}
