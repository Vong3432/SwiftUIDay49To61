//
//  CoreDataConstraintView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 13/01/2022.
//

import SwiftUI

struct CoreDataConstraintView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct CoreDataConstraintView_Previews: PreviewProvider {
    
    static let context = Project12DataController.shared.container.viewContext
    
    static var previews: some View {
        CoreDataConstraintView()
            .environment(\.managedObjectContext, context)
    }
}
