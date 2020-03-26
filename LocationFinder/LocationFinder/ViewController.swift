//
//  ViewController.swift
//  LocationFinder
//
//  Created by Kadin Mesriani on 3/26/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    
    var LAT = 34.0240892
    var LONG = -118.4747321
    
    var place:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        place = "nothing"
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 15000000, height: 15000000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
   
    @IBAction func zoomOut(_ sender: Any) {
    changeZoom(1)
    }
  
    @IBAction func zoomIn(_ sender: Any) {
    changeZoom(-1)
    }
    
  
    @IBAction func placeOne(_ sender: Any) {
    place = "Eiffel Tower"
        LAT = 48.8584
        LONG = 2.2945
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 2000, height: 2000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
  
    

    @IBAction func placeTwo(_ sender: Any) {
    place = "Colosseum"
        LAT = 41.8902
        LONG = 12.4922
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 2000, height: 2000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func placeThree(_ sender: Any) {
    place = "Big Ben"
        LAT =  51.5007
        LONG = 0.1246
        mapView.delegate = self
        let crossroadsPoint = MKMapPoint(CLLocationCoordinate2D(latitude: LAT, longitude: LONG))
        let size = MKMapSize(width: 2000, height: 2000)
        let rect = MKMapRect(origin: crossroadsPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    func changeZoom(_ exp: Double) {
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let currentLoc = CLLocationCoordinate2D(latitude: LAT, longitude: LONG)
        let currentPoint = MKMapPoint(currentLoc)
        if rect.contains(currentPoint) {
            label.text = "\(place) is here"
        } else {
            label.text = "You aren't at a given location"
        }
    }
}
