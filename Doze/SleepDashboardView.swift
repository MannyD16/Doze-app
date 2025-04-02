//
//  SleepDashboardView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI
import CoreData

struct SleepDashboardView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: SleepSession.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \SleepSession.startTime, ascending: false)]
    ) private var sessions: FetchedResults<SleepSession>

    var body: some View {
        NavigationView {
            List {
                ForEach(sessions, id: \.id) { session in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Start: \(formattedDate(session.startTime))")
                        Text("End: \(formattedDate(session.endTime))")
                        Text("Duration: \(session.duration / 60, specifier: "%.0f") minutes")
                            .foregroundColor(.cyan)
                        if let mood = session.mood, !mood.isEmpty {
                            Text("Mood: \(mood)").italic()
                        }
                        if let notes = session.notes, !notes.isEmpty {
                            Text("Notes: \(notes)").foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Sleep History")
        }
    }

    private func formattedDate(_ date: Date?) -> String {
        guard let date = date else { return "-" }
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    SleepDashboardView()
}
