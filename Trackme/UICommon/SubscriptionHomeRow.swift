//
//  SubscriptionHomeRow.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct SubscriptionHomeRow: View {
    @State var sObj: SubscriptionModel = SubscriptionModel(dict: ["name": "Sunrise", "icon": "spotify_logo", "price": "55.99"])
    var body: some View {
        HStack {
            Image(sObj.icon)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(sObj.name)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("$\(sObj.price)")
                .foregroundColor(.white)
        }
        
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64, maxHeight: 64)
        
        .background(Color.gray60.opacity(0.2))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray70, lineWidth: 1)
        }
        .cornerRadius(12)
    }
}

struct SubscriptionHomeRow_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionHomeRow()
    }
}
