//
//  LoginView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    @State private var hasLoginError = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 36) {
                LogoView()
                    .padding(.top, 40)
                
                CustomTextField("Email", text: $viewModel.email)
                
                CustomTextField("Password", text: $viewModel.password, isSecure: true)
                
                Button("Forgot password") {
                    
                }
                .font(.footnote)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button("Login") {
                    Task {
                        do {
                            try await viewModel.login()
                        } catch {
                            hasLoginError = true
                        }
                    }
                }
                .buttonStyle(.fullWidth(background: .green, foreground: .white))
                .buttonBorderShape(.roundedRectangle)
                
                Spacer()
                
                Divider()
                
                HStack {
                    Text("Don't have an account?")
                    
                    NavigationLink("Sign up", destination: RegistrationView.init)
                }
                .font(.footnote)
            }
            .padding()
            .alert("Could not log in", isPresented: $hasLoginError) {
                Button("Ok") { }
            }
        }
    }
}

#Preview {
    LoginView()
}
