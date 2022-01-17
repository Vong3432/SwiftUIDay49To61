//
//  CoreDataNsPredicateLearningView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 15/01/2022.
//

import SwiftUI

struct CoreDataNsPredicateLearningView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
    // %@ means insert some data here from arguments in NSPredicate()'s seconds parameter
    /**
     Examples:
     
     NSPredicate(format: "universe == %@", "Star wars")
     NSPredicate(format: "universe < %@", "F")
     NSPredicate(format: "universe > %@", "F")
     NSPredicate(format: "universe IN %@", ["Aliens", "Firefly"])
     
     More at https://www.hackingwithswift.com/books/ios-swiftui/filtering-fetchrequest-using-nspredicate
     */
    
    // show result when name is Executor or contains Falcon
    @FetchRequest(
        sortDescriptors: [],
        predicate: NSPredicate(
            format: "name IN %@ OR name CONTAINS %@",
            ["Falcon", "Executor"],
            "Falcon"
        )
    ) private var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List (ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown ship")
            }
            
            Button("Add examples", action: addExample)
        }
    }
    
    private func addExample() {
        let ship1 = Ship(context: moc)
        ship1.name = "Enterprise"
        ship1.universe = "Star Trek"
        
        let ship2 = Ship(context: moc)
        ship2.name = "Defiant"
        ship2.universe = "Star Trek"
        
        let ship3 = Ship(context: moc)
        ship3.name = "Millennium Falcon"
        ship3.universe = "Star Wars"
        
        let ship4 = Ship(context: moc)
        ship4.name = "Executor"
        ship4.universe = "Star Wars"
        
        try? moc.save()
    }
}

struct CoreDataNsPredicateLearningView_Previews: PreviewProvider {
    static let context = Project12DataController.shared.container.viewContext
    
    static var previews: some View {
        CoreDataNsPredicateLearningView()
            .environment(\.managedObjectContext, context)
    }
}
