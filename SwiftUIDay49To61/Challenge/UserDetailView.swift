//
//  UserDetailView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 16/01/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: ChallengeUser
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 12) {
                    Section {
                        Text(user.about)
                    } header: {
                        Text("About")
                            .font(.headline)
                    }
                }.padding(.horizontal)
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 12) {
                    Section {
                        Text(user.formattedRegisteredDate)
                    } header: {
                        Text("Registered at")
                            .font(.headline)
                    }
                }.padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Section {
                        Text(user.address)
                    } header: {
                        Text("Address")
                            .font(.headline)
                    }
                }.padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Section {
                        Text(user.email)
                    } header: {
                        Text("Email")
                            .font(.headline)
                    }
                }.padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Section{
                        Text(user.company)
                    } header: {
                        Text("Company")
                            .font(.headline)
                    }
                }.padding(.horizontal)
                
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(user.friends) { friend in
                                Text(friend.name)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.secondary)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(.ultraThickMaterial)
                                    .cornerRadius(18)
                            }
                        }
                        .padding(.horizontal)
                    }
                } header: {
                    Text("Friends")
                        .font(.headline)
                        .padding(.horizontal)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: ChallengeUser(id: "1", isActive: true, name: "John Doe", company: "Company ABC", email: "johndoe@gmail.com", address: "Address", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", age: 22, registered: Date.now, tags: ["Tag 1"], friends: [ChallengeFriend(id: "123", name: "Steve job"), ChallengeFriend(id: "123", name: "Steve job"),ChallengeFriend(id: "123", name: "Steve job"),ChallengeFriend(id: "123", name: "Steve job"), ChallengeFriend(id: "1223", name: "Steve ss")]))
        }
    }
}
