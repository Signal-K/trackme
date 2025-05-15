//
//  SocialSignupView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct SocialSignupView: View {
    @State private var navigationPath = NavigationPath()

    enum Destination: Hashable {
        case emailSignup
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            GeometryReader { geo in
                ZStack {
                    Color.grayC.ignoresSafeArea()

                    VStack(spacing: geo.size.height * 0.025) {
                        Spacer(minLength: geo.safeAreaInsets.top + 20)

                        Image("app_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.5)

                        Spacer()

                        socialButton(
                            backgroundImage: "apple_btn",
                            icon: "apple",
                            text: "Sign up with Apple",
                            foregroundColor: .white,
                            width: geo.size.width * 0.85
                        )

                        socialButton(
                            backgroundImage: "google_btn",
                            icon: "google",
                            text: "Sign up with Google",
                            foregroundColor: .grayC,
                            width: geo.size.width * 0.85
                        )

                        socialButton(
                            backgroundImage: "fb_btn",
                            icon: "fb",
                            text: "Sign up with Facebook",
                            foregroundColor: .white,
                            width: geo.size.width * 0.85
                        )

                        Text("or")
                            .font(.system(size: geo.size.width * 0.04))
                            .foregroundColor(.white)
                            .padding(.top, geo.size.height * 0.01)

                        SecondaryButton(title: "Sign up with email") {
                            navigationPath.append(Destination.emailSignup)
                        }

                        Text("By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.")
                            .font(.system(size: geo.size.width * 0.035))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray60)
                            .padding(.horizontal, 20)
                            .padding(.bottom, geo.safeAreaInsets.bottom + 10)
                    }
                    .frame(width: geo.size.width)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .emailSignup:
                    SignUpView()
                }
            }
        }
    }

    private func socialButton(backgroundImage: String, icon: String, text: String, foregroundColor: Color, width: CGFloat) -> some View {
        Button {
            // Handle social signup action
        } label: {
            ZStack {
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                HStack(spacing: 10) {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)

                    Text(text)
                        .font(.system(size: width * 0.045, weight: .semibold))
                }
                .padding(.horizontal, 20)
            }
        }
        .foregroundColor(foregroundColor)
        .shadow(color: foregroundColor.opacity(0.3), radius: 5, y: 3)
    }
}

struct SocialSignupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SocialSignupView().previewDevice("iPhone 15 Pro")
            SocialSignupView().previewDevice("iPad Pro (11-inch) (5th generation)")
        }
    }
}
