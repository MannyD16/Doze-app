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
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(sessions, id: \.id) { session in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text(formattedDate(session.startTime))
                                    .font(.headline)
                                Spacer()
                                Text("\(session.duration / 60, specifier: "%.0f") min")
                                    .foregroundColor(.purple)
                                    .font(.subheadline)
                            }
                            Divider().background(Color.purple.opacity(0.5))
                            if let mood = session.mood, !mood.isEmpty {
                                Text("Mood: \(mood)").italic().foregroundColor(.gray)
                            }
                            if let notes = session.notes, !notes.isEmpty {
                                Text("Notes: \(notes)").foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6).opacity(0.1))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.purple.opacity(0.5), lineWidth: 1)
                        )
                        .shadow(color: Color.purple.opacity(0.3), radius: 8, x: 0, y: 2)
                        .padding(.horizontal)
                    }

                    if sessions.isEmpty {
                        Text("No sleep sessions yet")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .padding(.vertical)
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Sleep History")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SleepLogView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.purple)
                    }
                }
            }
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
