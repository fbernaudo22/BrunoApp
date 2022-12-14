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
            VStack {
                HStack{
                    Spacer()
                    Image(sitter.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width * 0.40, height: geometry.size.height * 0.20)
                        .clipShape(Circle())
                    Spacer()
                    VStack(alignment: .leading, spacing: 5){
                        Text(sitter.name)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Rating: \(sitter.rating)")
                        Text("\(sitter.reviews) Reviews")
                    }
                    Spacer()
                }
                VStack{
                    Button(action: {print("Button Tap")},
                           label: {
                        /*Text ("Send a Message")
                         .font(.system(size: 14, weight: .medium, design: .rounded))
                         .foregroundColor(.orange)
                         .padding(10)
                         //.cornerRadius(10)
                         .frame(width: geometry.size.width * 0.50)
                         .border(Color.orange, width: 2)
                         .cornerRadius(10)*/
                        VStack {
                            Text ("Send a Message")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(.orange)
                                .padding(10)
                        }
                        .frame(width: geometry.size.width * 0.50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.orange, lineWidth: 2)
                        )
                    })
                    Text ("About me")
                        .fontWeight(.bold)
                        .font(.title2)
                    Text(sitter.description)
                        .padding()
                    HStack {
                        Text("For: \(sitter.animals)")
                    }
                    Map(coordinateRegion: $region, annotationItems: modelData.petsitters) {sit in
                        MapMarker(coordinate: sitter.locationCoordinates)
                    }
                }
            }
        }
    }
}


struct PetSitterDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        PetSitterDetail(sitter: modelData.petsitters[0],region: MKCoordinateRegion(center: modelData.petsitters[0].locationCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
            .environmentObject(ModelData())
    }
}

