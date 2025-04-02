//
//  SleepLogView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI

struct SleepLogView: View {
    @StateObject private var viewModel = SleepSessionViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    Text("Log Your Sleep")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    GroupBox(label: Label("Sleep Time", systemImage: "bed.double.fill").foregroundColor(.purple)) {
                        VStack {
                            DatePicker("Start Time", selection: $viewModel.startTime, displayedComponents: [.hourAndMinute])
                                .foregroundColor(.white)
                                .padding(.vertical, 4)
                            DatePicker("End Time", selection: $viewModel.endTime, displayedComponents: [.hourAndMinute])
                                .foregroundColor(.white)
                                .padding(.vertical, 4)
                        }
                        .padding()
                    }
                    .background(Color(.systemGray6).opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    GroupBox(label: Label("Mood", systemImage: "face.smiling.fill").foregroundColor(.purple)) {
                        TextField("How did you feel?", text: $viewModel.mood)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color(.systemGray6).opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    GroupBox(label: Label("Notes", systemImage: "note.text").foregroundColor(.purple)) {
                        TextField("Add any notes...", text: $viewModel.notes)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .background(Color(.systemGray6).opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)

                    Button(action: {
                        viewModel.saveSleepSession()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save Sleep Session")
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    SleepLogView()
}
