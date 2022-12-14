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
    
    static func giveStars(rating: String) ->String {
        let dblRating = Double(rating)
        var result: String
        
        switch(dblRating!){
        case 0...0.4:
            result = ""
        case 0.5...0.9:
            result = ""
        case 1.0...1.4:
            result = ""
        case 1.5...1.9:
            result = ""
        case 2.0...2.4:
            result = ""
        case 2.5...2.9:
            result = ""
        case 3.0...3.4:
            result = ""
        case 3.5...3.9:
            result = ""
        case 4.0...4.4:
            result = ""
        case 4.5...5.0:
            result = ""
        default:
            result = ""
        }
        return result
        
    }
    

}



