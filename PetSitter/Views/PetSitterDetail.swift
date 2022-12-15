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
                                
                                StarsView(rating: Float(sitter.rating)!)
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
                            .font(.system(size: 26,weight: .semibold))
                            .padding(.top)
                            .padding(.leading)
                            .padding(.bottom,1)
                        Text(sitter.description)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.horizontal)
                        HStack (spacing: 2) {
                            Text("For:")
                                .fontWeight(.semibold)
                            Text(" \(sitter.animals)")
                            
                            Spacer()
                            NavigationLink(destination: ChatView(), label: {
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
                        //reviews
                        HStack {
                            Text("Reviews")
                                .font(.system(size: 26,weight: .semibold))
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Text("Giggin o' Bibitar")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.horizontal)
                                .padding(.top,1)
                            StarsView(rating: Float(sitter.rating)!)
                                .font(.system(size: 12, weight: .bold))
                        }
                        Text("Overall was good, but he looks a lot like chewbecca and i hate star wars")
                            .font(.system(size: 16))
                            .padding(.horizontal)
                        HStack {
                            Text("Ciro the Immortal")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.horizontal)
                                .padding(.top,1)
                            StarsView(rating: Float(sitter.rating)!)
                                .font(.system(size: 12, weight: .bold))
                        }
                        Text("Good")
                            .font(.system(size: 16))
                            .padding(.horizontal)
                        //fine reviews
                        
                        
                        
                        
                        
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

