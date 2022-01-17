//
//  DataController.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 08/01/2022.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    static let shared = DataController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Bookworm")
        
        // start loading data
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
