//
//  IconItemRow.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct IconItemRow: View {
    @State var icon: String = "face_id"
    @State var title: String = "Title"
    @State var value: String = "Value"
    
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text(title)
                .foregroundColor(.white)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.gray30)
            
            Image("next")
                .resizable()
                .frame(width: 12, height: 12)
        }
        
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

struct IconItemRow_Previews: PreviewProvider {
    static var previews: some View {
        IconItemRow()
            .background(Color.gray60.opacity(0.2))
    }
}
