//
//  AuthManager.swift
//  Supabase Auth
//
//  Created by Liam Arbuckle on 19/5/2025.
//

import Foundation
import Supabase

class AuthManager {
    static let shared = AuthManager()
    
    private init() {
        
    }

    let client = SupabaseClient(supabaseURL: URL(string: "http://127.0.0.1:54321")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0")
    
    func signInWithApple(idToken: String, nonce: String) async throws {
        let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
    }
}
