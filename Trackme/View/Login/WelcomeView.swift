//
//  WelcomeView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State var showSignIn: Bool = false
    @State var showSignUp: Bool = false
    
    var body: some View {
        ZStack {
            Image("welcome_screen")
                .resizable()
                .scaledToFill()
                .frame(width: .screenHeight, height: .screenHeight)
            
            VStack {
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.5))
                    .padding(.top, .topInsets + 8)
                
                Spacer()
                
                Text("FromScroobles")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                PrimaryButton(title: "Get Started", onPressed: {
                    showSignUp.toggle()
                }) 
                .background( NavigationLink(destination: SocialSignupView(), isActive: $showSignUp, label: {
                    EmptyView()
                }) )
                .padding(.bottom, 15)
                
                SecondaryButton(title: "I have an account", onPressed: {
                    showSignIn.toggle()
                })
                {
                    
                } label: {
                    ZStack{
                        Image("primary_btn")
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal, 20)
                            .frame(width: .screenWidth, height: 48)
                        
                        Text("Get Started")
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, .bottomInsets)
                }
            }
        }
        
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
