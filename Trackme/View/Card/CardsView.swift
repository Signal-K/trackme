//
//  CardsView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct CardsView: View {
    @State private var cardArr: [CreditCardModel] = [
        CreditCardModel(name: "Code for card 1", number: "**** *** **** 4036", month_year: "08/28"),
        CreditCardModel(name: "Code for card 2", number: "**** *** **** 4046", month_year: "08/29")
    ]

    @State private var subArr: [SubscriptionModel] = [
        SubscriptionModel(dict: ["name": "Sunrise", "icon": "spotify_logo", "price": "55.99"])
    ]

    var body: some View {
        ScrollView {
            VStack {
                headerView

                CardStack(cardArr) { cObj in
                    cardItem(for: cObj)
                }
                .padding(.vertical, 20)

                subscriptionsView

                footerCard
            }
            .padding(.top, .topInsets)
        }
        .background(Color.grayC)
        .ignoresSafeArea()
    }

    private var headerView: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    // settings tapped
                } label: {
                    Image("settings")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray30)
                }
            }

            Text("Credit Cards")
                .foregroundColor(.gray30)
        }
        .padding(.horizontal, 20)
    }

    private func cardItem(for cObj: CreditCardModel) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray70)
                .frame(width: 232, height: 350)
                .shadow(color: .black.opacity(0.2), radius: 4)

            Image("card_blank")
                .resizable()
                .scaledToFit()
                .frame(width: 232, height: 350)

            VStack(spacing: 8) {
                Spacer().frame(height: 22)
                Image("mastercard_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Text("Virtual Card")
                Spacer()
                Text(cObj.name).foregroundColor(.gray20)
                Text(cObj.number)
                Text(cObj.month_year)
                Spacer()
            }
            .foregroundColor(.white)
        }
    }

    private var subscriptionsView: some View {
        VStack {
            Text("Subscriptions")

            HStack(spacing: 10) {
                Spacer()
                ForEach(subArr) { sObj in
                    Image(sObj.icon)
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        .padding(.top, 20)
    }

    private var footerCard: some View {
        VStack {
            Button {
                // Add card action
            } label: {
                HStack {
                    Text("Add new card ")
                    Image("add")
                        .resizable()
                        .frame(width: 14, height: 14)
                }
            }
            .foregroundColor(.gray30)
            .frame(maxWidth: .infinity, minHeight: 64)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5, 4]))
                    .foregroundColor(.gray30.opacity(0.5))
            }
            .cornerRadius(16)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)

            Spacer()
        }
        .frame(width: .screenWidth, height: 300)
        .background(Color.gray70)
        .cornerRadius(radius: 24, corners: [.topLeft, .topRight])
        .padding(.top, 40)
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
