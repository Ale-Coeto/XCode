//
//  MLAppApp.swift
//  MLApp
//
//  Created by Alejandra Coeto on 07/02/23.
//

import SwiftUI

@main
struct MLAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
