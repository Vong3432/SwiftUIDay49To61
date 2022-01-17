//
//  FilteredSingerList.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 15/01/2022.
//

import SwiftUI

struct FilteredSingerList: View {
    
    @FetchRequest var fetchedRequest: FetchedResults<Singer>
    
    init(filter: String) {
        // _ means the struct/class itself, instead of instance
        // by assigning to _fetchRequest, we aren’t trying to say “here’s a whole bunch of new results we want to you to use,” but instead we’re telling Swift we want to change the whole fetch request itself.
        _fetchedRequest = FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
    
    var body: some View {
        List(fetchedRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}
//
//struct FilteredSingerList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredSingerList()
//    }
//}
