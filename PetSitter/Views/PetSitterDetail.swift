//
//  PetSitterDetail.swift
//  PetSitter
//
//  Created by Francesco Bernaudo on 12/12/22.
//

import SwiftUI
import MapKit

struct PetSitterDetail: View {
    @EnvironmentObject var modelData: ModelData
    var sitter: petSitter
    @State var region: MKCoordinateRegion
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack{
                        Image(sitter.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .padding(.leading)
                        Spacer()
                        VStack(alignment: .leading){
                            Text(sitter.name)
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .padding(.bottom, 1)
                            HStack{
                                Text("Rating:")
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                Text("\(sitter.rating)")
                                Text("\(sitter.reviews)")
                            }
                            .font(.system(size: 16, weight: .regular))
                            
                            HStack (spacing: 4) {
                                Text("1.6 km")
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                Text("from you")
                            }
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading){
                        Text ("About me")
                            .font(.system(size: 22,weight: .semibold))
                            .padding(.top)
                            .padding(.leading)
                        Text(sitter.description)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal)
                        HStack (spacing: 2) {
                            Text("For:")
                            Text(" \(sitter.animals)")
                            
                            Spacer()
                            Button(action: {print("Button Tap")},
                                   label: {
                                VStack {
                                    Text ("\(Image(systemName: "message.fill"))  Send a Message")
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(Color.arancione)
                                        .padding(10)
                                }
                                .frame(width: geometry.size.width * 0.50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.arancione, lineWidth: 2)
                                )
                            })
                        }
                        .padding(.horizontal)
                        
                        Map(coordinateRegion: $region, annotationItems: modelData.petsitters) {sit in
                            MapMarker(coordinate: sitter.locationCoordinates)
                        }
                        .cornerRadius(26)
                        .padding()
                        .frame(height: geometry.size.height * 0.5)
                        
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .font(.system(size: 16, weight: .regular, design: .rounded))
    }
}


struct PetSitterDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        PetSitterDetail(sitter: modelData.petsitters[0],region: MKCoordinateRegion(center: modelData.petsitters[0].locationCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
            .environmentObject(ModelData())
    }
}

