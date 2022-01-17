//
//  SwiftUIDay49To61App.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 05/01/2022.
//

import SwiftUI

@main
struct SwiftUIDay49To61App: App {
    @StateObject private var dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
