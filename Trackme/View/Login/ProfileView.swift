//
//  ProfileView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 23/5/2025.
//

import SwiftUI

struct ProfileView: View {
    var onProfileUpdated: (() -> Void)? = nil

    @State var username = ""
    @State var fullName = ""
    @State var website = ""
    @State var isLoading = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer().frame(height: 60)

                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)

                Text("Edit Profile")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)

                VStack(spacing: 16) {
                    CustomTextField(placeholder: "Username", text: $username)
                    CustomTextField(placeholder: "Full Name", text: $fullName)
                    CustomTextField(placeholder: "Website", text: $website)
                }

                Button(action: updateProfileButtonTapped) {
                    Text("Update Profile")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primary10)
                        .cornerRadius(12)
                }

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, .topInsets)
        }
        .background(Color.grayC)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Sign Out", role: .destructive) {
                    Task {
                        try? await supabase.auth.signOut()
                    }
                }
            }
        }
        .task {
            await getInitialProfile()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }

    func getInitialProfile() async {
        do {
            let currentUser = try await supabase.auth.session.user
            let profile: Profile = try await supabase
                .from("profiles")
                .select()
                .eq("id", value: currentUser.id)
                .single()
                .execute()
                .value

            self.username = profile.username ?? ""
            self.fullName = profile.fullName ?? ""
            self.website = profile.website ?? ""
        } catch {
            debugPrint(error)
        }
    }

    func updateProfileButtonTapped() {
        Task {
            isLoading = true
            defer { isLoading = false }

            do {
                let currentUser = try await supabase.auth.session.user
                try await supabase
                    .from("profiles")
                    .update(
                        UpdateProfileParams(
                            username: username,
                            fullName: fullName,
                            website: website
                        )
                    )
                    .eq("id", value: currentUser.id)
                    .execute()

                onProfileUpdated?()
            } catch {
                debugPrint(error)
            }
        }
    }
}
