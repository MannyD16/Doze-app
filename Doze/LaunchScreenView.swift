//
//  LaunchScreenView.swift
//  Doze
//
//  Created by Manuel Diaz on 4/2/25.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 12) {
                Image(systemName: "moon.stars.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.purple)
                    .opacity(isActive ? 1 : 0.5)
                    .scaleEffect(isActive ? 1 : 0.8)

                Text("Doze")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .opacity(isActive ? 1 : 0.5)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.2)) {
                    isActive = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                    // Switch to MainTabView
                    if let window = UIApplication.shared.connectedScenes
                        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                        window.windows.first?.rootViewController = UIHostingController(rootView: MainTabView().environment(\.managedObjectContext, CoreDataStack.shared.context))
                        window.windows.first?.makeKeyAndVisible()
                    }
                }
            }
                }
            }
        }

#Preview {
    LaunchScreenView()
}
