//
//  SignInView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct SignInView: View {
    @State private var txtLogin: String = ""
    @State private var txtPassword: String = ""
    @State private var isRemember: Bool = false
    @State private var showSignUp: Bool = false

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Color.grayC.ignoresSafeArea()

                    VStack(spacing: geo.size.height * 0.025) {
                        Spacer(minLength: geo.safeAreaInsets.top + 20)

                        Image("app_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.5)

                        RoundTextField(title: "Login", text: $txtLogin, keyboardType: .emailAddress)
                            .padding(.horizontal, geo.size.width * 0.05)

                        RoundTextField(title: "Password", text: $txtPassword, isPassword: true)
                            .padding(.horizontal, geo.size.width * 0.05)

                        HStack {
                            Button {
                                isRemember.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: isRemember ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 18, height: 18)

                                    Text("Remember me")
                                        .font(.system(size: geo.size.width * 0.035))
                                }
                            }

                            Spacer()

                            Button {
                                // Handle password reset
                            } label: {
                                Text("Forgot Password?")
                                    .font(.system(size: geo.size.width * 0.035))
                            }
                        }
                        .foregroundColor(.gray50)
                        .padding(.horizontal, geo.size.width * 0.05)

                        PrimaryButton(title: "Sign In") {
                            // Handle sign-in
                        }

                        Spacer()

                        Text("If you don't have an account yet")
                            .font(.system(size: geo.size.width * 0.04))
                            .foregroundColor(.white)

                        SecondaryButton(title: "Sign Up") {
                            showSignUp.toggle()
                        }
                        .background(
                            NavigationLink(destination: SignUpView(), isActive: $showSignUp) {
                                EmptyView()
                            }
                        )
                        .padding(.bottom, geo.safeAreaInsets.bottom + 10)
                    }
                    .frame(width: geo.size.width)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView().previewDevice("iPhone 15 Pro")
            SignInView().previewDevice("iPad Pro (11-inch) (5th generation)")
        }
    }
}
