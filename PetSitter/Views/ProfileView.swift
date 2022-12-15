//
//  ProfileView.swift
//  PetSitter
//
//  Created by Francesco Bernaudo on 12/12/22.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    var body: some View {
        NavigationStack{
            VStack(spacing: 30 ){
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                Text(user.username)
                    .font(.title2.bold())
            }
                        Form{
                Section("Account "){
                    NavigationLink("Messages", destination: ChatView())
                    NavigationLink("Notifications", destination: ChatView())
                    NavigationLink("Password", destination: ChatView())
                    NavigationLink("Edit Profile", destination: ChatView())
                    
                }
                Section("Support"){
                    NavigationLink("Instructions", destination: ChatView())
                    NavigationLink("Privacy policy", destination: ChatView())
                    NavigationLink("Terms and conditions", destination: ChatView())
                    NavigationLink("FAQ", destination: ChatView())
                    
                }
                Section{
                    NavigationLink("Delete account", destination: ChatView())
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ProfileView(user: modelData.user)
            .environmentObject(ModelData())
    }
}
