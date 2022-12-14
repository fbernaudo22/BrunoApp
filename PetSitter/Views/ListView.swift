//
//  PetSitterList.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
// prova

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
            VStack {
                HStack{
                    Text("Ordered by:")
                    Spacer()
                    Picker("Ordered by:", selection: $selectedItem) {
                        ForEach(pickerOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
                ScrollView {
                    ForEach(filteredItems) { sitter in
                        PetSitterCard(sitter: sitter)
                    }
                }.searchable(text: $search)
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .automatic,   content: {NavigationLink( destination: ProfileView(),
                                                                               label: {
                    Image("preview_profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .shadow(radius: 2)
                        .frame(width: 50, height: 50)
                })}
                            
                )}
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
