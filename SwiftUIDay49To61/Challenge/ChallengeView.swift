//
//  ChallengeView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 16/01/2022.
//

import SwiftUI

struct ChallengeView: View {
//    @Environment(\.managedObjectContext) private var moc
    @StateObject private var challengeVM = ChallengeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(challengeVM.users) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(user.name)
                                        .font(.title3)
                                }
                            }
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }.padding()
            }
            .navigationTitle("Users")
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
