//
//  ContentView.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Dashboard", systemImage: "doc.plaintext.fill")
                }.tag(1)
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }.tag(2)
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message.fill")
                }.tag(3)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}


//  prova commit Desy

