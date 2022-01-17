//
//  DynamicFilteringCoreDataView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 15/01/2022.
//

import SwiftUI

struct DynamicFilteringCoreDataView: View {
    
    @Environment(\.managedObjectContext) private var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            // list of matching singers
            //            FilteredSingerList(filter: lastNameFilter)
            
            FilteredList(
                filterKey: "lastName",
                filterValue: lastNameFilter,
                predicate: .contains,
                sortDescriptors: [SortDescriptor<Singer>(\.firstName)]) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFilteringCoreDataView_Previews: PreviewProvider {
    static let context = Project12DataController.shared.container.viewContext
    static var previews: some View {
        DynamicFilteringCoreDataView()
            .environment(\.managedObjectContext, context)
    }
}
