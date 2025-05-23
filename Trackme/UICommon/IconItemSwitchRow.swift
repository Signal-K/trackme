//
//  IconItemSwitchRow.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct IconItemSwitchRow: View {
    @State var icon: String = "face_id"
    @State var title: String = "Title"
    @Binding var value: Bool
    
    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text(title)
                .foregroundColor(.white)
            
            Spacer()
            Toggle(isOn: $value) {
                
            }
        }
        
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

struct IconItemSwitchRow_Previews: PreviewProvider {
    @State static var isNO: Bool = false
    static var previews: some View {
        IconItemSwitchRow( value: $isNO)
            .background(Color.gray60.opacity(0.2))
    }
}
