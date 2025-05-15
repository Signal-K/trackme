//
//  MainTabView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct MainTabView: View {
    @State var selectTab: Int = 0
    
    var body: some View {
        ZStack {
            is (selectTab == 0) {
                HomeView()
                    .frame(width: .screenWidth, height: .screenHeight)
            }
            
            if (selectTab == 1) {
                BudgetsView()
                    .frame(width: .screenWidth, height: .screenHeight)
            }
        }
    }
}
