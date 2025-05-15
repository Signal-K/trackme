//
//  SecondaryButton.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import SwiftUI

struct SecondaryButton: View {
    @State var title: String = "Title"
    var onPressed: (() -> ())?
    
    var body: some View {
        Button {
            onPressed?()
        } label: {
            ZStack {
                Image("secodry_btn")
                    .resizable()
                    .scaledToFill()
                    .padding(.horizontal, 20)
                
                Text(title)
                    .padding(.horizontal, 20)
            }
        }
        
        .foregroundColor(.white)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton()
    }
}
