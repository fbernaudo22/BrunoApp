//
//  PetSitterApp.swift
//  PetSitter
//
//  Created by Francesco Bernaudo on 10/12/22.
//

import SwiftUI

@main
struct PetSitterApp: App {
    @StateObject var modelData = ModelData()
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
                .environmentObject(LocationManager())
                .accentColor(.arancione)
        }
    }
}
