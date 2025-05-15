//
//  WelcomeView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigationPath = NavigationPath()

    enum Destination: Hashable {
        case signUp
        case signIn
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            GeometryReader { geometry in
                ZStack {
                    Image("welcome_screen")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()

                    VStack(spacing: geometry.size.height * 0.02) {
                        Spacer(minLength: geometry.safeAreaInsets.top + 30)

                        Image("app_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.5)
                            .padding(.top, 10)

                        Spacer()

                        Text("FromScroobles")
                            .font(.system(size: geometry.size.width * 0.045, weight: .medium))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)

                        PrimaryButton(title: "Get Started") {
                            navigationPath.append(Destination.signUp)
                        }
                        .padding(.bottom, 15)

                        SecondaryButton(title: "I have an account") {
                            navigationPath.append(Destination.signIn)
                        }
                        .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
                    }
                    .frame(width: geometry.size.width)
                }
                .ignoresSafeArea()
            }
            .navigationBarHidden(true)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .signUp:
                    SocialSignupView()
                case .signIn:
                    SignInView()
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
