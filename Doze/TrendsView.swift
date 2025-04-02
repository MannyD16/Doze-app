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
        sortDescriptors: [NSSortDescriptor(keyPath: \SleepSession.startTime, ascending: true)]
    ) private var sessions: FetchedResults<SleepSession>

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
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
                    Chart {
                        ForEach(sessions, id: \.id) { session in
                            if session.duration > 0 {
                                BarMark(
                                    x: .value("Date", session.startTime ?? Date()),
                                    y: .value("Duration", session.duration / 60) // in minutes
                                )
                                .foregroundStyle(Color.purple)
                            }
                        }
                    }
                    .frame(height: 250)
                    .padding()
                }

                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TrendsView()
}
