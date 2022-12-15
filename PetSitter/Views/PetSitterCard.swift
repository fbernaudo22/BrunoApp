//
//  PetSitterCard.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
//

import SwiftUI
import CoreLocation


struct PetSitterCard: View {
    @EnvironmentObject var locationManager: LocationManager
    var sitter: petSitter
    var distance: Double = 0.0
    var body: some View {
        //GeometryReader { geometry in
            HStack {
                Image("\(sitter.imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80,
                           height: 80,
                           alignment: .center)
                    .clipped()
                    .cornerRadius(22)
                VStack (alignment: .leading) {
                    Text(sitter.name)
                        .font(.system(size: 17, weight: .bold))
                    HStack {
                        //Text("\(petSitter.giveStars(rating: sitter.rating))")
                            //.font(.system(size: 12, weight: .bold))
                        StarsView(rating: Float(sitter.rating)!)
                            .font(.system(size: 12, weight: .bold))
                        Text("\(sitter.reviews)")
                            .font(.system(size: 12, weight: .regular))
                    }
                    HStack{
                        Text(locationManager.distanceInKM(latitude: sitter.locationCoordinates.latitude, longitude: sitter.locationCoordinates.longitude), format: .number.precision(.significantDigits(4)))
                            .font(.system(size: 12, weight: .bold))
                        Text("Km from you")
                            .font(.system(size: 12, weight: .regular))
                    }
                    HStack {
                        Text("For:")
                            .font(.system(size: 12, weight: .bold))

                        Text("\(sitter.animals)")
                            .font(.system(size: 12, weight: .regular))

                    }
                    
                }
                Spacer()
                /*Image(systemName: "chevron.right")
                    .font(.system(size: 20,weight: .regular))
                    .foregroundColor(Color.arancione)*/
                   
            }
            .fontDesign(.rounded)
        //}
            //.padding(.horizontal)
    }
}

struct PetSitterCard_Previews: PreviewProvider {
    static let locationManager = LocationManager()
    static let modelData = ModelData()
    static var previews: some View {
        PetSitterCard(sitter: modelData.petsitters[0], distance: 2.0)
            .environmentObject(ModelData())
            .environmentObject(LocationManager())
    }
}
