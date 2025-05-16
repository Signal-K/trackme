//
//  BudgetsView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct BudgetsView: View {
    @State private var listArr: [BudgetModel] = [
        BudgetModel(dict: [
            "name": "Transport",
            "icon": "auto_&_transport",
            "spend_amount": "55.99",
            "total_amount": "55.99",
            "left_amount": "00.00",
            "color": Color.secondaryC
        ]),
        BudgetModel(dict: [
            "name": "Entertainment",
            "icon": "entertainment",
            "spend_amount": "55.99",
            "total_amount": "55.99",
            "left_amount": "00.00",
            "color": Color.secondaryC
        ]),
        BudgetModel(dict: [
            "name": "Utilities",
            "icon": "security",
            "spend_amount": "55.99",
            "total_amount": "55.99",
            "left_amount": "00.00",
            "color": Color.secondaryC
        ])
    ]
    
    @State private var arcArr: [ArcModel] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // MARK: - Arc Display
                ZStack(alignment: .bottom) {
                    ArcShape180(width: 10)
                        .foregroundColor(.gray.opacity(0.2))
                    
                    ForEach(arcArr, id: \.id) { aObj in
                        ArcShape180(start: aObj.StatVal, end: aObj.value - 9, width: 14)
                            .foregroundColor(aObj.color)
                            .shadow(color: aObj.color.opacity(0.5), radius: 7)
                    }
                }
                .frame(width: .widthPer(per: 0.5), height: .widthPer(per: 0.3))
                
                VStack(spacing: 4) {
                    Text("$8,290")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text("of $5,000 budget")
                        .foregroundColor(.gray30)
                }
                
                // MARK: - Budget Summary Button
                Button(action: {
                    // Action
                }) {
                    Text("Your budgets are on track")
                        .frame(maxWidth: .infinity, minHeight: 64)
                }
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray70, lineWidth: 1)
                )
                .cornerRadius(16)
                .padding(.horizontal, 20)
                
                // MARK: - Budget List
                LazyVStack(spacing: 15) {
                    ForEach(listArr, id: \.id) { bObj in
                        BudgetRow(bObj: bObj)
                    }
                }
                .padding(.horizontal, 20)
                
                // MARK: - Add Category
                Button(action: {
                    // Add new category action
                }) {
                    HStack {
                        Text("Add new category")
                        Image("add")
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                    .frame(maxWidth: .infinity, minHeight: 64)
                }
                .foregroundColor(.gray30)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5, 4]))
                        .foregroundColor(.gray30.opacity(0.5))
                )
                .cornerRadius(16)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
            .padding(.top, 64)
        }
        .onAppear {
            getArcProgressData()
        }
        .background(Color.grayC)
        .ignoresSafeArea()
    }
    
    func getArcProgressData() {
        var data = [
            ArcModel(value: 20, color: .secondaryG),
            ArcModel(value: 45, color: .secondaryC),
            ArcModel(value: 70, color: .primary10)
        ]
        
        var val = 0.0
        
        for i in (0 ..< data.count) {
            data[i].StatVal = val
            val = data[i].StatVal + data[i].value + 2
        }
        
        arcArr = data
    }
}

struct BudgetsView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetsView()
    }
}
