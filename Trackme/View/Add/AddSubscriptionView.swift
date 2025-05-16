//
//  AddSubscriptionView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct AddSubscriptionView: View {
    var UIState: UIStateModel

    @State var txtDescription: String = ""
    @State var subArr: [SubscriptionModel] = [
        SubscriptionModel(dict: ["id": 0, "name": "Sunrise", "icon": "spotify_logo", "price": "55.99"]),
        SubscriptionModel(dict: ["id": 1, "name": "Cingular", "icon": "youtube_logo", "price": "5.99"])
    ]
    @State var amountVal: Double = 0.09

    var body: some View {
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 80
        let cardHeight: CGFloat = 200

        ScrollView {
            ZStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.gray70.opacity(0.5))
                    .frame(width: .screenWidth)
                    .cornerRadius(25)

                VStack {
                    ZStack {
                        HStack {
                            Button {
                                // Back action
                            } label: {
                                Image("back")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            Spacer()
                        }

                        HStack {
                            Spacer()
                            Text("New")
                            Spacer()
                        }
                    }
                    .foregroundColor(.gray30)

                    Text("Add new subscription")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)

                    Canvas {
                        Carousel(
                            numberOfItems: CGFloat(subArr.count),
                            spacing: spacing,
                            widthOfHiddenCards: widthOfHiddenCards
                        ) {
                            ForEach(subArr, id: \.self.id) { item in
                                Item(
                                    _id: Int(item.itemId),
                                    spacing: spacing,
                                    widthOfHiddenCards: widthOfHiddenCards,
                                    cardHeight: cardHeight
                                ) {
                                    VStack {
                                        Image(item.icon)
                                            .resizable()
                                            .scaledToFit()

                                        Spacer().frame(height: 20)

                                        Text("\(item.name)")
                                    }
                                }
                                .foregroundColor(.gray30)
                                .cornerRadius(8)
                                .shadow(radius: 4, x: 0, y: 4)
                                .transition(AnyTransition.slide)
                                .animation(.spring(), value: UIState.activeCard)
                            }
                        }
                        .environmentObject(self.UIState)
                    }
                    .padding(.vertical, 20)
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
            }
            .frame(width: .screenWidth)

            RoundTextField(title: "Description", text: $txtDescription, textAlign: .center)
                .frame(width: .screenWidth - 40)
                .padding(.top, 20)

            HStack {
                Button {
                    amountVal -= 0.1
                    if amountVal < 0.0 { amountVal = 0.0 }
                } label: {
                    Image("minus")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)

                Spacer()

                VStack(spacing: 0) {
                    Text("Monthly price")
                        .foregroundColor(.gray40)

                    Spacer().frame(height: 4)

                    Text("$\(amountVal, specifier: "%.2f")")
                        .foregroundColor(.white)

                    Spacer().frame(height: 8)

                    Rectangle()
                        .fill(Color.gray70)
                        .frame(width: 150, height: 1)
                }

                Spacer()

                Button {
                    amountVal += 0.1
                } label: {
                    Image("plus")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)
            }
            .padding(40)

            PrimaryButton(title: "Add this platform") {
                // Add subscription action
            }
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
        }
        .background(Color.grayC)
        .ignoresSafeArea()
    }
}

struct AddSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AddSubscriptionView(UIState: UIStateModel())
    }
}
