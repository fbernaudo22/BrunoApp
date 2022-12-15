//
//  LocationManager.swift
//  MapkitProject
//
//  Created by Francesco Bernaudo on 09/12/22.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

final class LocationManager: NSObject, ObservableObject {
    @Published var location: CLLocation?
    
    private var locationManager = CLLocationManager()
    
    override init() { //costruttore di classe con costruttore della classe padre e le seguenti proprietà
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    func distanceInKM(latitude: Double, longitude: Double) -> Double { //Here's the method I made to calculate an actual distance
            
            let houseCoordinates = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
            
            let userCoordinates = CLLocation(latitude: location?.coordinate.latitude ?? 50, longitude: location?.coordinate.longitude ?? 30)
            let distance = userCoordinates.distance(from: houseCoordinates) / 1000 //.distance comes in meters so /1000 is to have a KM value
            
           // let s = String(format: "%.0f", distance)
            
            return Double(distance)
        }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        DispatchQueue.main.async {  //fa si che location venga aggiornata dal delegate in maniera asincrona rispetto al main thread
            self.location = location
        }
    }
}

extension MKCoordinateRegion {
    static func locationRegion()->MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:40.83715 , longitude: 14.30616 ), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>?  {
        Binding<MKCoordinateRegion>.constant(self)
    }
}
