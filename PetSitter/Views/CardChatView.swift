//
//  CardChatView.swift
//  PetSitter
//
//  Created by Francesco Bernaudo on 13/12/22.
//

import SwiftUI

struct CardChatView: View {
    @EnvironmentObject var modelData: ModelData
    var sitter: petSitter
    var body: some View {
        HStack(spacing: 20) {
            Image(sitter.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(sitter.name)
                            .bold()
                        Spacer()
                        Text("05/12/2022")
                    }
                    HStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies dolor sit amet porttitor sagittis. Praesent et iaculis risus. Duis convallis elit nisi, nec ornare neque pulvinar ac.!")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
            }
        }
        .frame(height: 80)
    }
}

struct CardChatView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        CardChatView(sitter: modelData.petsitters[0])
            .environmentObject(ModelData())
    }
}
