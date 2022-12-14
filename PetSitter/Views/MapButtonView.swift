//
//  MapButtonView.swift
//  PetSitter
//
//  Created by Alberto Mura on 14/12/22.
//

import SwiftUI

struct MapButtonView: View {
    @State private var isPresented = false
    var body: some View {
        Button {
            isPresented = true
        } label: {
            HStack {
                Image(systemName: "map.fill")
                    .font(.headline)
                Text("Map")
                    .fontWeight(.regular)
                    .font(.headline)
            }
            //.navigationBarBackButtonHidden()
            .buttonStyle(.borderless)
            .clipShape(Rectangle())
            .cornerRadius(1)
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            .foregroundColor(.arancione)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.arancione, lineWidth: 4)
            )
            .background(Color(UIColor.systemBackground))
                .cornerRadius(15)
        }
        .fullScreenCover(isPresented: $isPresented, content: {MapView()})
    }
}

struct MapButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MapButtonView()
    }
}
