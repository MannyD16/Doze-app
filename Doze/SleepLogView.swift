//
//  SleepLogView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI

struct SleepLogView: View {
    @StateObject private var viewModel = SleepSessionViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sleep Time")) {
                    DatePicker("Start", selection: $viewModel.startTime, displayedComponents: .hourAndMinute)
                    DatePicker("End", selection: $viewModel.endTime, displayedComponents: .hourAndMinute)
                }

                Section(header: Text("Mood")) {
                    TextField("How did you feel?", text: $viewModel.mood)
                }

                Section(header: Text("Notes")) {
                    TextField("Add any notes...", text: $viewModel.notes)
                }

                Section {
                    Button(action: {
                        viewModel.saveSleepSession()
                    }) {
                        Text("Save Sleep Session")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .navigationTitle("Log Sleep")
        }
    }
}

#Preview {
    SleepLogView()
}
