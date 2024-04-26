//
//  LoginView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 36) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.top, 40)
            
            CustomTextField("Email", text: $viewModel.email)
            
            CustomTextField("Password", text: $viewModel.password, isSecure: true)
            
            Button("Forgot password") {
                
            }
            .font(.footnote)
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Button("Login") {
                
            }
            .buttonStyle(.fullWidth(background: .green, foreground: .white))
            .buttonBorderShape(.roundedRectangle)
            
            Spacer()
            
            Divider()
            
            HStack {
                Text("Don't have an account?")
                
                Button("Sign up") {
                    
                }
            }
            .font(.footnote)
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
