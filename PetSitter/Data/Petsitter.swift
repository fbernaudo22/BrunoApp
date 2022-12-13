//
//  DogSitter.swift
//  Dogsitter
//
//  Created by Francesco Bernaudo on 06/12/22.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct petSitter: Identifiable, Codable, Hashable {
    var name: String
    var address: String
    var animals: String
    var price: String
    var rating: String
    var reviews: Int
    private var coordinates: Coordinates
    var description: String
    var imageName: String
    var image: Image? {
        Image(imageName)
    }
    var id: Int
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    

}



