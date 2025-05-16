//
//  BudgetRow.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct BudgetRow: View {
    @State var bObj: BudgetModel = BudgetModel(dict: [
        "name": "Transport",
        "icon": "auto_&_transport",
        "spend_amount": "55.99",
        "total_amount": "55.99",
        "left_amount": "00.00",
        "color": Color.secondaryG
    ])
    
    var body: some View {
        VStack {
            HStack {
                Image(bObj.icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray40)
                
                VStack {
                    Text(bObj.name)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("$\(bObj.left_amount) left to spend")
                        .foregroundColor(.gray30)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                VStack(alignment: .trailing) {
                    Text("$\(bObj.total_amount)")
                        .foregroundColor(.white)
                        .frame(alignment: .trailing)
                    
                    Text("of $\(bObj.left_amount)")
                        .foregroundColor(.gray30)
                        .frame(alignment: .trailing)
                }
            }
            
            ProgressView(value: bObj.perSpend, total: 1)
                .tint(bObj.color)
        }
        
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.gray60.opacity( 0.2 ))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray70, lineWidth: 1)
        }
        .cornerRadius(12)
    }
}

struct BudgetRow_Previews: PreviewProvider {
    static var previews: some View {
        BudgetRow()
    }
}
