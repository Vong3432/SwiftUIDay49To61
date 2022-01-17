//
//  Result.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 05/01/2022.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
