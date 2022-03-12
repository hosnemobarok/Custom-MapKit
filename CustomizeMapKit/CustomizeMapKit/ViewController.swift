//
//  ViewController.swift
//  CustomizeMapKit
//
//  Created by Md Hosne Mobarok on 9/3/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureMap()
        self.placePins()
        
        mapView.delegate = self
    }

    func configureMap() {
        let center = CLLocationCoordinate2D(latitude: 40.730824, longitude: -73.997330)
        let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        self.placePins()
    }
    
    func placePins() {
        let coords = [CLLocationCoordinate2D(latitude: 40.689249, longitude: -74.044500), CLLocationCoordinate2D(latitude: 40.781174, longitude: -73.966660), CLLocationCoordinate2D(latitude: 40.748817, longitude: -73.985428), CLLocationCoordinate2D(latitude: 40.706175, longitude: -73.996918)]
        let titles = ["Statue Of Liberty", "Central Park", "Empire State Building", "Brooklyn Bridge", "Dhaka"]
        for i in coords.indices {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coords[i]
            annotation.title = titles[i]
            mapView.addAnnotation(annotation)
        }
    }
    
    // Customizing Annotation Color
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
        annotationView.markerTintColor = UIColor.blue
        return annotationView
    }

}

