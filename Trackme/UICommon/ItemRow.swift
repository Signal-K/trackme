//
//  ItemRow.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct ItemRow: View {
    @State var title: String = "Title"
    @State var value: String = "Value"
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Text(value)
                .foregroundColor(.gray30)
            
            Image("next")
                .resizable()
                .frame(width: 12, height: 20)
        }
        
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow()
            .background(Color.gray60.opacity(0.2))
    }
}
