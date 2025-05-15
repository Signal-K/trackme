//
//  AuthView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 15/5/2025.
//

import Foundation
import SwiftUI
//import Supabase

struct AuthView: View {
    @State var email = ""
    @State var isLoading = false
    @State var result: Result<Void, Error>?
    
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
            }
        }
    }
}
