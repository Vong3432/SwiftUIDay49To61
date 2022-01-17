//
//  Project12View.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 13/01/2022.
//

import SwiftUI

struct Project12View: View {
    
    @FetchRequest(sortDescriptors: []) private var movies: FetchedResults<Movie>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Project12View_Previews: PreviewProvider {
    static var previews: some View {
        Project12View()
    }
}
