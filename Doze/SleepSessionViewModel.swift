//
//  SleepSessionViewModel.swift
//  Doze
//
//  Created by Manuel Diaz on 3/31/25.
//

import Foundation
import CoreData

class SleepSessionViewModel: ObservableObject {
    private let context = CoreDataStack.shared.context

    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    @Published var notes: String = ""
    @Published var mood: String = ""

    func saveSleepSession() {
        let session = SleepSession(context: context)
        session.id = UUID()
        session.startTime = startTime
        session.endTime = endTime
        session.duration = endTime.timeIntervalSince(startTime)
        session.notes = notes
        session.mood = mood

        do {
            try context.save()
            print("Sleep session saved.")
        } catch {
            print("Failed to save session: \(error.localizedDescription)")
        }
    }
}

