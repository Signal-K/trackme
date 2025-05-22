//
//  MainTabView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tab = .profile
    @State var isProfileComplete = false
    
    enum Tab {
        case income
        case profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            IncomeBucketsView()
                .tabItem {
                    Label("Income", systemImage: "dollarsign.circle")
                }
                .tag(Tab.income)
            
            ProfileView(onProfileUpdated: {
                isProfileComplete = true
                selectedTab = .income
            })
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            .tag(Tab.profile)
        }
        .onAppear {
            // You can check profile completeness here, then set selected tab accordingly
            if isProfileComplete {
                selectedTab = .income
            } else {
                selectedTab = .profile
            }
        }
        .accentColor(.primary10)
        .background(Color.grayC.ignoresSafeArea())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
