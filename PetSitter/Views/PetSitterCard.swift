//
//  PetSitterCard.swift
//  PetSittingApp
//
//  Created by Pietro Ciuci on 07/12/22.
//

import SwiftUI


struct PetSitterCard: View {
    var sitter: petSitter
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
                        Text("\(petSitter.giveStars(rating: sitter.rating))")
                            .font(.system(size: 12, weight: .bold))

                        Text("\(sitter.reviews)")
                            .font(.system(size: 12, weight: .regular))
                    }
                    HStack{
                        Text("1.6 km")
                            .font(.system(size: 12, weight: .bold))
                        Text("from you")
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
    static let modelData = ModelData()
    static var previews: some View {
        PetSitterCard(sitter: modelData.petsitters[0])
            .environmentObject(ModelData())
    }
}
