//
//  FilteredList.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 15/01/2022.
//
import CoreData
import SwiftUI

enum FilteredListPredicate: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchedRequest: FetchedResults<T>
    
    // closure
    let content: (T) -> Content
    
    init(filterKey: String, filterValue: String, predicate: FilteredListPredicate = .beginsWith, sortDescriptors: [SortDescriptor<T>], @ViewBuilder content: @escaping (T) -> Content) {
        print(predicate.rawValue)
        _fetchedRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
    
    var body: some View {
        List(fetchedRequest, id: \.self) { item in
            self.content(item)
        }
    }
}
