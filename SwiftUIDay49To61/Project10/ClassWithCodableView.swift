//
//  ClassWithCodableView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 07/01/2022.
//

import SwiftUI

final class User: ObservableObject, Codable {
    @Published var name = "John Doe"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
    enum CodingKeys: CodingKey {
        case name
    }
}

struct ClassWithCodableView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ClassWithCodableView_Previews: PreviewProvider {
    static var previews: some View {
        ClassWithCodableView()
    }
}
