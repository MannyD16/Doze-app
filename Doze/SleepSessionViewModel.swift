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

    func saveSleepSession() -> Bool {
        var adjustedEndTime = endTime

        if endTime <= startTime {
            // Handle overnight sleep session
            adjustedEndTime = Calendar.current.date(byAdding: .day, value: 1, to: endTime) ?? endTime
        }

        let session = SleepSession(context: context)
        session.id = UUID()
        session.startTime = startTime
        session.endTime = adjustedEndTime
        session.duration = adjustedEndTime.timeIntervalSince(startTime)
        session.notes = notes
        session.mood = mood

        do {
            try context.save()
            reset()
            return true
        } catch {
            print("Failed to save session: \(error.localizedDescription)")
            return false
        }
    }

    func reset() {
        startTime = Date()
        endTime = Date()
        notes = ""
        mood = ""
    }
}


