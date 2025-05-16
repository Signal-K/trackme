//
//  SubscriptionInfoView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct SubscriptionInfoView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var sObj: SubscriptionModel = SubscriptionModel(dict: ["id": 1, "name": "Sunrise", "icon": "spotify_logo", "price": "55.99"])
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                VStack {
                    VStack {
                        HStack {
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("dorp_down")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            
                            Spacer()
                            Text("Subscription Info")
                            Spacer()
                            Button {
                                mode.wrappedValue.dismiss()
                            } label: {
                                Image("Trash")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .foregroundColor(.gray30)
                        .padding()
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 15) {
                            Image(sObj.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: .widthPer(per: 0.25), height: .widthPer(per: 0.25))
                            
                            Text(sObj.name)
                                .foregroundColor(.white)
                            
                            Text("$\(sObj.price)")
                                .foregroundColor(.gray30)
                        }
                        
                        Spacer()
                    }
                    
                    .frame(width: .screenWidth - 40, height: .widthPer(per: 0.9))
                    .background(Color.gray70)
                    .cornerRadius(radius: 24, corners: [.topLeft, .topRight])
                    
                    VStack {
                        VStack {
                            ItemRow(title: "Name", value: sObj.name )
                            ItemRow(title: "Description", value: "Telecommunications")
                            ItemRow(title: "Category", value: "Utilities" )
                            ItemRow(title: "First payment", value: "08.04.2025" )
                            ItemRow(title: "Reminder", value: "Never" )
                            ItemRow(title: "Currency", value: "CHF (C)" )
                        }
                        
                        .padding(.vertical, 15)
                        .background(Color.gray20.opacity(0.2))
                        .cornerRadius(15)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray30.opacity(0.3), lineWidth: 1)
                        }
                        
                        SecondaryButton( title: "Save", onPressed: {
                            
                        })
                        
                        .padding(.horizontal, 20)
                        .padding(.top, 15)
                    }
                    
                    .padding(20)
                }
                
                .background(Color(hex: "282833"))
                .frame(width: .screenWidth - 40)
                .cornerRadius(radius: 24, corners: .allCorners)
                .padding(.top, .topInsets)
                
                VStack {
                    Spacer()
                    HStack {
                        Circle()
                            .fill(Color.grayC)
                            .frame(width: 30, height: 30)
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 1, alignment: .bottom)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                    .foregroundColor(Color.grayC)
                            )
                        Circle()
                            .fill(Color.grayC)
                            .frame(width: 30, height: 30)
                    }
                }
                
                .frame(width: .screenWidth - 15, height: .widthPer(per: 0.9) + 15)
                .padding(.top, .topInsets)
            }
            
            .padding(20)
        }
        
        .ignoresSafeArea()
        .background(Color.grayC)
    }
}

struct SubscriptionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionInfoView()
    }
}
