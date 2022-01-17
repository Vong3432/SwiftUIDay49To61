//
//  User.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 16/01/2022.
//

import Foundation

struct ChallengeUser: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name, company, email, address, about: String
    let age: Int
    let registered: Date
    let tags: [String]
    let friends: [ChallengeFriend]
    
    var formattedRegisteredDate: String {
        registered.formatted(date: .abbreviated, time: .shortened)
    }
}

struct ChallengeFriend: Codable, Identifiable {
    let id: String
    let name: String
}
