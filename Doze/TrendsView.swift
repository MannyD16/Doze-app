//
//  TrendsView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI
import Charts
import CoreData

struct TrendsView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        entity: SleepSession.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \SleepSession.startTime, ascending: true))
    ) private var sessions: FetchedResults<SleepSession>

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Text("Trends")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top)

                if sessions.isEmpty {
                    Text("No sleep data yet")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    // Total Duration Chart
                    Text("Total Sleep Duration")
                        .foregroundColor(.white)
                        .font(.headline)
                    Chart {
                        ForEach(sessions, id: \.id) { session in
                            if session.duration > 0 {
                                BarMark(
                                    x: .value("Date", session.startTime ?? Date()),
                                    y: .value("Duration", session.duration / 60)
                                )
                                .foregroundStyle(Color.purple)
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding()

                    // Weekly Average (Optional)
                    if let weeklyAverage = calculateWeeklyAverage() {
                        Text("Weekly Average: \(weeklyAverage, specifier: "%.1f") mins")
                            .foregroundColor(.purple)
                            .padding(.horizontal)
                    }
                }

                Spacer()
            }
            .padding(.horizontal)
        }
    }

    // MARK: - Helper
    private func calculateWeeklyAverage() -> Double? {
        guard !sessions.isEmpty else { return nil }
        let total = sessions.reduce(0) { $0 + $1.duration }
        return total / Double(sessions.count) / 60
    }
}

#Preview {
    TrendsView()
}
