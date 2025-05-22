//
//  AppView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 23/5/2025.
//

import SwiftUI

struct AppView: View {
    @State var isAuthenticated = false
    
    var body: some View {
        Group {
            if isAuthenticated {
                MainTabView()
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
