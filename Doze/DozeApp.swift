//
//  DozeApp.swift
//  Doze
//
//  Created by Manuel Diaz on 3/30/25.
//

import SwiftUI

@main
struct DozeApp: App {
    let persistenceController = CoreDataStack.shared
    @AppStorage("darkMode") private var darkMode = true

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environment(\.managedObjectContext, persistenceController.context)
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}


