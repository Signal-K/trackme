//
//  SignupView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var txtEmail: String = ""
    @State private var txtPassword: String = ""
    @State private var navigationPath = NavigationPath()

    enum Destination: Hashable {
        case signIn
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

                        RoundTextField(title: "E-mail Address", text: $txtEmail, keyboardType: .emailAddress)
                            .padding(.horizontal, geo.size.width * 0.05)

                        RoundTextField(title: "Password", text: $txtPassword, isPassword: true)
                            .padding(.horizontal, geo.size.width * 0.05)

                        HStack(spacing: 5) {
                            ForEach(0..<4) { _ in
                                Rectangle()
                                    .frame(height: 5)
                                    .foregroundColor(.gray70)
                            }
                        }
                        .padding(.horizontal, geo.size.width * 0.1)

                        Text("Use 8 or more characters")
                            .font(.system(size: geo.size.width * 0.035))
                            .foregroundColor(.gray50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, geo.size.width * 0.05)

                        PrimaryButton(title: "Get Started") {
                            // Handle sign-up logic
                        }

                        Spacer()

                        Text("Do you already have an account?")
                            .font(.system(size: geo.size.width * 0.04))
                            .foregroundColor(.white)
                            .padding(.bottom, 10)

                        SecondaryButton(title: "Sign In") {
                            navigationPath.append(Destination.signIn)
                        }
                        .padding(.bottom, geo.safeAreaInsets.bottom + 8)
                    }
                    .frame(width: geo.size.width)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .signIn:
                    SignInView()
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView().previewDevice("iPhone 15 Pro")
            SignUpView().previewDevice("iPad Pro (11-inch) (5th generation)")
        }
    }
}
