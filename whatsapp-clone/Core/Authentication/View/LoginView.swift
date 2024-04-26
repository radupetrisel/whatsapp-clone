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

struct FullWidthButtonStyle<Background, Foreground>: ButtonStyle
where Background: ShapeStyle,
      Foreground: ShapeStyle {
    let background: Background
    let foreground: Foreground
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(background, in: .buttonBorder)
            .foregroundStyle(foreground)
    }
}

struct AnyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

extension ButtonStyle where Self == AnyButtonStyle {
    static func fullWidth<Background, Foreground>(background: Background, foreground: Foreground) -> FullWidthButtonStyle<Background, Foreground> where Background: ShapeStyle, Foreground: ShapeStyle {
        FullWidthButtonStyle(background: background, foreground: foreground)
    }
}

#Preview {
    LoginView()
}
