//
//  placeholder.swift
//  PetSittingApp
//
//  Created by Francesco Bernaudo on 10/12/22.
//

import SwiftUI

struct placeholder: View {
    var imageName: String?
    var image: Image {
        imageName == nil ? Image(systemName: "person.fill") : Image(imageName!)
    }
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 50, height: 50)
            .shadow(radius: 5)
    }
}

struct placeholder_Previews: PreviewProvider {
    static var previews: some View {
        placeholder()
    }
}
