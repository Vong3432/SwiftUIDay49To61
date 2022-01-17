//
//  ChallengeDataController.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 17/01/2022.
//
import CoreData
import Foundation

class ChallengeDataController {
    
    static let shared = ChallengeDataController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ChallengeCoreData")
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}

