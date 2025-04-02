//
//  SettingsView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.purple)
                        Text("Welcome to Doze")
                    }
                }

                Section(header: Text("App Settings")) {
                    Toggle(isOn: .constant(true)) {
                        Text("Dark Mode")
                    }
                    Toggle(isOn: .constant(false)) {
                        Text("Notifications")
                    }
                }

                Section(header: Text("About")) {
                    Text("Version 1.0.0")
                    Text("Built by Manny Diaz")
                }
            }
            .background(Color.black.ignoresSafeArea())
            .scrollContentBackground(.hidden)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
