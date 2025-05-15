//
//  PrimaryButton.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct PrimaryButton: View {
    @State var title: String = "Title"
    var onPressed: (()->())?
                    
    var body: some View {
        Button {
            onPressed?()
        } label: {
            ZStack {
            Image("primary_btn")
                .resizable()
                .scaledToFill()
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, height: 48)
                
            Text(title)
                .padding(.horizontal, 20)
            }
        }
        
        .foregroundColor(.white)
        .shadow(color: .secondaryC.opacity(0.3), radius: 5, y: 3)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
