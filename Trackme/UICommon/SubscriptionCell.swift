//
//  SubscriptionCell.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct SubscriptionCell: View {
    @State var sObj: SubscriptionModel = SubscriptionModel(dict: ["name": "Sunrise", "icon": "spotify_logo", "price": "55.99"])
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(sObj.icon)
                .resizable()
                .frame(width: 45, height: 45)
            
            Spacer()
            
            Text(sObj.name)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text( "$\(sObj.price)" )
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fill)
        .background(Color.gray60.opacity(0.2))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray70, lineWidth: 1)
        }
        
        .cornerRadius(12)
    }
}

struct SubscriptionCell_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionCell()
    }
}
