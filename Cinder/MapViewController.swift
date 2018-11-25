//
//  ViewController.swift
//  Cinder
//
//  Created by Mazen Alotaibi on 11/21/18.
//  Copyright © 2018 Mazen Alotaibi. All rights reserved.
//

import UIKit
import Firebase
import MapKit
import CoreLocation
class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.map.delegate = self
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addRegion(_ sender: Any) {
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        print("\(locValue.latitude), \(locValue.longitude)")
        //let coord = map.convert(locValue, toCoordinateFrom: map)
        let region = CLCircularRegion(center: locValue, radius: 100, identifier: "geofence")
        region.notifyOnEntry = true
        region.notifyOnExit = false
        //map.removeOverlay(map?.overlays as! MKOverlay)
        locationManager.startMonitoring(for: region)
        let circle = MKCircle(center: locValue, radius: region.radius)
 
        map.addAnnotation(circle)
        map.addOverlay(circle)

    }

}
extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        map.showsUserLocation = true
    }
}
// drawing geo area over map
extension MapViewController: MKMapViewDelegate{

    func mapView(_ map: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let cricleOverlay = overlay as? MKCircle else { return MKOverlayRenderer() }
        let circleRenderer = MKCircleRenderer(circle: cricleOverlay)
        circleRenderer.strokeColor = .red
        circleRenderer.fillColor = .red
        circleRenderer.alpha = 0.5
        print("overlay has been showen in map!!")
        return circleRenderer
        //map.addOverlay(circleRenderer)
    }
}
