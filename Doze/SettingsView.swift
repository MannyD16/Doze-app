//
//  SettingsView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Form {
                Section(header: Text("Profile").foregroundColor(.purple)) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.purple)
                        VStack(alignment: .leading) {
                            Text("Manny Diaz")
                                .foregroundColor(.white)
                            Text("Doze User")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }

                Section(header: Text("App Settings").foregroundColor(.purple)) {
                    Toggle(isOn: .constant(true)) {
                        Text("Dark Mode").foregroundColor(.white)
                    }
                    Toggle(isOn: .constant(false)) {
                        Text("Notifications").foregroundColor(.white)
                    }
                }

                Section(header: Text("About").foregroundColor(.purple)) {
                    Text("Version 1.0.0")
                        .foregroundColor(.gray)
                    Text("Built by Manny Diaz")
                        .foregroundColor(.gray)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}

