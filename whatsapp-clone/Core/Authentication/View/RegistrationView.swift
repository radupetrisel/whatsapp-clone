//
//  RegistrationView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var viewModel = RegistrationViewModel()
    
    @State private var hasSignUpError = false
    
    var body: some View {
        VStack(spacing: 32) {
            LogoView()
                .padding(.top, 40)
            
            CustomTextField("Email", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            CustomTextField("Full name", text: $viewModel.fullName)
                .autocorrectionDisabled()
            
            CustomTextField("Phone number", text: $viewModel.phoneNumber)
                .keyboardType(.numberPad)
            
            CustomTextField("Password", text: $viewModel.password, isSecure: true)
                .autocorrectionDisabled()
            
            Button("Sign up") {
                Task {
                    do {
                        try await viewModel.createUser()
                    } catch {
                        hasSignUpError = true
                    }
                }
            }
            .buttonStyle(.fullWidth(background: .green, foreground: .white))
            .buttonBorderShape(.roundedRectangle)
            .padding(.top)
            
            Spacer()
            
            Divider()
            
            HStack {
                Text("Already have an account?")
                Button("Sign in") {
                    
                }
            }
            .font(.footnote)
        }
        .alert("Could not sign up", isPresented: $hasSignUpError) {
            Button("Ok") { }
        }
        .padding()
        .toolbar { toolbar }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            CustomBackButton()
        }
    }
}

#Preview {
    RegistrationView()
}
