//
//  WelcomeView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isAuthenticated = false
    @State private var isProfileComplete = false

    var body: some View {
        Group {
            if isAuthenticated {
                if isProfileComplete {
                    MainTabView()
                } else {
                    ProfileView(onProfileUpdated: {
                        isProfileComplete = true
                    })
                }
            } else {
                AuthView()
            }
        }
        .task {
            for await state in supabase.auth.authStateChanges {
                if [.initialSession, .signedIn, .signedOut].contains(state.event) {
                    isAuthenticated = state.session != nil
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeView()
                .previewDevice("iPhone 15 Pro")
            WelcomeView()
                .previewDevice("iPad Pro (11-inch) (5th generation)")
        }
    }
}
