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
        VStack {
            HStack{
                Spacer()
                Image(sitter.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                Spacer()
                VStack(spacing: 5){
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
                    Text ("Send a Message")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .padding(.horizontal, 40.0)
                        .background(Color                  .black.opacity(0.8))
                        .cornerRadius(10)
                })
                Text(sitter.description)
                    .padding(10)
                HStack {
                    Text("For: \(sitter.animals)")
                }
                Map(coordinateRegion: $region, annotationItems: modelData.petsitters) {sit in
                    MapMarker(coordinate: sitter.locationCoordinates)
                    }
                }
                Button {
                    print("Leaving a review")
                } label: {
                    Text("Leave a review")
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
 
