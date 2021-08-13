//
//  test7App.swift
//  test7
//
//  Created by Nolan on 8/12/21.
//

import SwiftUI

@main
struct test7App: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
