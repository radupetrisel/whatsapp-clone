//
//  RegistrationView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            LogoView()
                .padding(.top, 40)
            
            CustomTextField("Email", text: $viewModel.email)
            CustomTextField("Full name", text: $viewModel.fullName)
            CustomTextField("Phone number", text: $viewModel.phoneNumber)
                .keyboardType(.numberPad)
            
            CustomTextField("Password", text: $viewModel.password, isSecure: true)
            
            Button("Sign up") {
                
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
