//
//  BottomTabBar.swift
//  Trackme
//
//  Created by Liam Arbuckle on 23/5/2025.
//

import SwiftUI

struct BottomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .center) {
                Image("bottom_bar_bg")
                    .resizable()
                    .scaledToFit()

                HStack(alignment: .center, spacing: 0) {
                    Spacer()

                    tabButton(index: 0, imageName: "home")
                    Spacer()

                    tabButton(index: 1, imageName: "budgets")
                    Spacer()

                    Rectangle().fill(.clear).frame(width: 80)

                    tabButton(index: 2, imageName: "calendar")
                    Spacer()

                    tabButton(index: 3, imageName: "creditcards")
                    Spacer()
                }
            }

            Button {
                // Center button action
            } label: {
                Image("center_btn")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
            }
            .padding(.bottom, 6)
            .shadow(color: .secondaryC.opacity(0.5), radius: 6, y: 4)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, .bottomInsets)
    }

    @ViewBuilder
    private func tabButton(index: Int, imageName: String) -> some View {
        Button {
            selectedTab = index
        } label: {
            Image(imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .padding()
                .foregroundColor(selectedTab == index ? .white : .gray30)
        }
    }
}
