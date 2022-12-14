//
//  ChatView.swift
//  PetSittingApp
//
//  Created by Francesco Bernaudo on 08/12/22.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var query = ""
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredSitters) { sitter in
                    CardChatView(sitter: sitter)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action: { isPresented = true }, label: {
                Image(systemName: "square.and.pencil")
                    .searchable(text: $query)
            }))
        }
        .sheet(isPresented: $isPresented) {
            HelloWorldView()
        }
    }
    
    var filteredSitters: [petSitter] {
        if (query.isEmpty) {
            return modelData.petsitters
        }
        else {
            return modelData.petsitters.filter { $0.name.localizedCaseInsensitiveContains(query) }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ChatView()
            .environmentObject(ModelData())
    }
}
