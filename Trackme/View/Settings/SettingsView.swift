//
//  SettingsView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct SettingsView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Image("back")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Settings")
                        Spacer()
                    }
                }
                
                .foregroundColor(.gray30)
            }
            
            .padding(.top, .topInsets)
            
            VStack(spacing: 4) {
                Image("u1")
                    .resizable()
                    .frame(width: 70, height: 70)
                Spacer()
                    .frame(height: 15)
                Text("Code")
                    .foregroundColor(.white)
                Text("teddy@lovescroobl.es")
                    .accentColor(.gray30)
                
                Spacer()
                    .frame(height: 15)
                
                Button {
                    
                } label: {
                    Text("Edit Profile")
                }
                
                .foregroundColor(.white)
                .padding(8)
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(12)
            }
            
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("General")
                    .padding(.top, 8)
                
                VStack {
                    IconItemRow(icon: "face_id", title: "Security", value: "FaceID")
                }
            }
        }
    }
}
