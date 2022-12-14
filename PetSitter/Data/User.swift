//
//  User.swift
//  PetSitter
//
//  Created by Francesco Bernaudo on 13/12/22.
//

import Foundation
import SwiftUI
import MapKit

struct User: Identifiable {
    var id = UUID()
    var username: String
    var imageName: String = ""
    var image: Image? {
        Image(imageName)
    }
    var location: CLLocationCoordinate2D
    var inbox: [Message]?
    
    init(){
        self.username = "DefaultUser"
        self.location = CLLocationCoordinate2D(latitude:40.83715 , longitude: 14.30616 )
        self.imageName = "profile_preview"
    }
}

struct Message: Identifiable {
    var id = UUID()
    var sender: String
    var date: Date
    var object: String
    var body: String
    
    
    
}
