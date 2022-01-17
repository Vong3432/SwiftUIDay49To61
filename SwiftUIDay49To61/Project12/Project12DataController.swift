//
//  Project12DataController.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 13/01/2022.
//

import Foundation
import CoreData

class Project12DataController {
    static let shared = Project12DataController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoreDataProject")
        
        // start loading data
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
            // merge duplicate objects based on properties
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}

