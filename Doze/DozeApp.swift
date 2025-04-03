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

    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}

