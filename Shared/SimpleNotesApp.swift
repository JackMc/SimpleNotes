//
//  SimpleNotesApp.swift
//  Shared
//
//  Created by Jack McCracken on 2021-01-23.
//

import SwiftUI

@main
struct SimpleNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
