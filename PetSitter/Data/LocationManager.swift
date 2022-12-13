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
