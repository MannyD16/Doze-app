//
//  CoreDataStack.swift
//  Doze
//
//  Created by Manuel Diaz on 3/30/25.
//

import CoreData

struct CoreDataStack {
    static let shared = CoreDataStack()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "DozeDataModel") // Make sure this matches your xcdatamodeld file name
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Unresolved error loading Core Data: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error saving Core Data: \(error)")
            }
        }
    }
}

