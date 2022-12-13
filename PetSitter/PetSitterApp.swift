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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
