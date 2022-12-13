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
        HStack {
            Image("\(sitter.imageName)")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 120, height: 120)
            VStack (alignment: .leading, spacing: 10) {
                Text(sitter.name)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack(spacing: 15) {
                    Text("Rating: \(sitter.rating)")
                        .font(.caption)
                    Text("\(sitter.reviews) reviews")
                        .font(.caption)
                }
                Text("1.6 km from you")
                    .font(.caption2)
                    .padding(.top, 3)
                Text("For: \(sitter.animals)")
                    .font(.caption2)
                    .padding(.top, 3)
            }
            Spacer()
        }
        .frame(width: 350, height: 140)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct PetSitterCard_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        PetSitterCard(sitter: modelData.petsitters[0])
            .environmentObject(ModelData())
    }
}
