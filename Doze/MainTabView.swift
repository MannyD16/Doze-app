//
//  MainTabView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SleepDashboardView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }

            SleepLogView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Log Sleep")
                }
            
            Text("Settings")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(.purple)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    MainTabView()
}
