//
//  PetSitterList.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
//

import SwiftUI
import MapKit

struct ListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var search: String = ""
    @State private var selectedItem = "Name"
    let pickerOptions = ["Name","Rating","Distance","Price"]
    var filteredItems: [petSitter] {
        if search.isEmpty {
            return modelData.petsitters}
        else {
            return modelData.petsitters.filter {$0.name.localizedCaseInsensitiveContains(search) || $0.rating.localizedCaseInsensitiveContains(search) || $0.animals.localizedCaseInsensitiveContains(search)}
        }
    }
    var body: some View {
        NavigationStack{
            ZStack{
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
                    ScrollView(showsIndicators: false) {
                        ForEach(filteredItems) { sitter in
                            NavigationLink(destination: PetSitterDetail(sitter: sitter, region: MKCoordinateRegion(center: sitter.locationCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))), label:{PetSitterCard(sitter: sitter)
                            })
                        }
                        .searchable(text: $search)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
                VStack{
                    Spacer()
                    VStack{
                        Spacer()
                        NavigationLink(destination: MapView(), label: {
                            MapButtonView()
                        })
                    }
                }
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .automatic,   content: {NavigationLink( destination: ProfileView(user: modelData.user),
                                                                               label: {
                    Image("preview_profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .frame(width: 50, height: 50)
                })}
                            
                )}
            .navigationBarBackButtonHidden()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ListView()
            .environmentObject(ModelData())
    }
}
