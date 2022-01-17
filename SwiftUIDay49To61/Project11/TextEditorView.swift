//
//  Project11View.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 08/01/2022.
//

import SwiftUI

struct Project11View: View {
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct Project11View_Previews: PreviewProvider {
    static var previews: some View {
        Project11View()
    }
}
