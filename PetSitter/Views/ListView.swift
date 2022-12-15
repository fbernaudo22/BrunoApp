//
//  PetSitterList.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
// prova

import SwiftUI
import MapKit

struct ListView: View {
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var modelData: ModelData
    @State private var search: String = ""
    @State private var selectedItem = "Name"
    let pickerOptions = ["Name","Rating"]
    var sortedSitters: [petSitter] {
        if (selectedItem == "Name") {
            return modelData.petsitters.sorted {
                $0.name < $1.name
            }
        }
        else if (selectedItem == "Reviews") {
            return modelData.petsitters.sorted {
                $0.reviews > $1.reviews
            }
        }
        else {
            return modelData.petsitters
        }
    }
    var filteredItems: [petSitter] {
        if search.isEmpty {
            return sortedSitters}
        else {
            return sortedSitters.filter {$0.name.localizedCaseInsensitiveContains(search) || $0.rating.localizedCaseInsensitiveContains(search) || $0.animals.localizedCaseInsensitiveContains(search)}
        }
    }
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                VStack(alignment: .center) {
                    HStack{
                        Text("Filtered by:")
                        Spacer()
                        Picker("Ordered by:", selection: $selectedItem) {
                            ForEach(pickerOptions, id: \.self) { option in
                                Text(option)
                            }
                        }.pickerStyle(.automatic)
                    }
                    
                    .padding(.horizontal)
                    List {
                        ForEach(filteredItems) { sitter in
                            NavigationLink {
                                PetSitterDetail(sitter: sitter, region: MKCoordinateRegion(center: sitter.locationCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
                            } label: {
                                PetSitterCard(sitter: sitter)
                            }
                            .searchable(text: $search)
                        }
                    }
                    .searchable(text: $search)
                    .listStyle(PlainListStyle())
                }
                VStack{
                    Spacer()
                }
                MapButtonView()
                    .padding(.bottom, 30)
            }
            .ignoresSafeArea(edges: .bottom)
            .ignoresSafeArea(.keyboard)
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .automatic,   content: {NavigationLink( destination: ProfileView(user: modelData.user), label: {
                    Image("preview_profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                })}
                )}
            .navigationBarBackButtonHidden()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static let locationManager = LocationManager()
    static var previews: some View {
        ListView()
            .environmentObject(ModelData())
            .environmentObject(LocationManager())
    }
}
