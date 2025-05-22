import SwiftUI

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var result: Result<Void, Error>?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer()
                    .frame(height: 60)
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Text("Sign in to 'TrackMe'")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                VStack(spacing: 16) {
                    CustomTextField(placeholder: "Email", text: $email, isSecure: false)
                    CustomTextField(placeholder: "Password", text: $password, isSecure: true)
                }
                
                if let result {
                    switch result {
                    case .success:
                        Text("Signed in successfully!")
                            .foregroundColor(.green)
                    case .failure(let error):
                        Text(error.localizedDescription)
                            .foregroundColor(.red)
                    }
                }
                
                VStack(spacing: 14) {
                    Button(action: signInButtonTapped) {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primary10)
                            .cornerRadius(12)
                    }
                    
                    Button(action: signUpButtonTapped) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray60.opacity(0.2))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray70, lineWidth: 1)
                            )
                            .cornerRadius(12)
                    }
                }
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding()
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, .topInsets)
        }
        
        .background(Color.grayC)
        .ignoresSafeArea()
    }
    
    func signInButtonTapped() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                try await supabase.auth.signIn(email: email, password: password)
                result = .success(())
            } catch {
                result = .failure(error)
            }
        }
    }
    
    func signUpButtonTapped() {
        Task {
            isLoading = true
            defer { isLoading = false }
            do {
                try await supabase.auth.signUp(email: email, password: password)
                result = .success(())
            } catch {
                result = .failure(error)
            }
        }
    }
}
