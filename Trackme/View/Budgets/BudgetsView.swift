//
//  BudgetsView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct BudgetsView: View {
    @State var listArr: [BudgetModel] = [
        BudgetModel(dict: [
            "name": "Transport",
            "icon": "auto_&_transport",
            "spend_amount": "55,99",
            "total_amount": "55.99",
            "left_amount": "00.00",
            "color": Color.secondaryC
        ]),
        BudgetModel(dict: [
            "name": "Entertainment",
            "icon": "entertainment",
            "spend_amount": "55,99",
            "total_amount": "55.99",
            "left_amount": "00.00",
            "color": Color.secondaryC
        ]),
        BudgetModel(dict: [
            "name": "Utilities",
            "icon": "security",
            "spend_amount": "55,99",
            "total_amount": "55.99",
            "left_amount": "00.00",
            "color": Color.secondaryC
        ]),
    ]
    
    @State var arcArr: [ArcModel] = []
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                ArcShape180(width: 10)
                    .foregroundColor(.gray.opacity(0.2))
                
                ForEach(arcArr, id: \.id) { aObj in
                    ArcShape180(start: aObj.statVal, end: aObj.value - 9, width: 14)
                        .foregroundColor(aObj.color)
                        .shadow(color: aObj.color.opacity(0.5, radius: 7))
                }
            }
            
            .frame(width: .widthPer(per: 0.5), height: .widthPer(per: 0.3))
            
            VStack {
                Text("$8,290")
                    .foregroundColor(.white)
                
                Text("of $5,000 budget")
                    .foregroundColor(.gray30)
            }
        }
        
        .padding(.top, 64)
        .padding(.bottom, 30)
    }
}
