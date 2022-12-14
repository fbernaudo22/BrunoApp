//
//  MapView.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    //@Binding var buttonIsActive: Bool
    @EnvironmentObject var modelData: ModelData
    @StateObject private var locationManager = LocationManager()
    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.locationRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        return region.getBinding()
    }
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:40.83715 , longitude: 14.30616 ), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    var body: some View {
        NavigationStack{
            ZStack{
                Map(coordinateRegion: region!,interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.none), annotationItems: modelData.petsitters) {location in
                    MapAnnotation(coordinate: location.locationCoordinates) { NavigationLink(destination: PetSitterDetail(sitter: location, region: MKCoordinateRegion(center: location.locationCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))), label: {placeholder(imageName: location.imageName)
                    })
                    }}.ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: ListView(), label: {
                            Image(systemName: "house.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        })
                        .buttonStyle(.borderedProminent)
                        .clipShape(Circle())
                        .padding(.horizontal)
                        .navigationBarBackButtonHidden()
                    }
                }
            }
        }
        
    }
}


struct MapView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        MapView()
            .environmentObject(ModelData())
    }
}
