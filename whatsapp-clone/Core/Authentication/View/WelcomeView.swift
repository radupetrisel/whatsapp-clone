//
//  WelcomeView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var selectedLanguage = "English"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Image(.welcome)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding(.horizontal, 30)
                
                VStack(spacing: 30) {
                    Text("Welcome to WhatsApp")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Group {
                        Text("Read our")
                        + Text(" Privacy Policy")
                            .foregroundStyle(.blue)
                        + Text(". Tap Agree and continue to accept the")
                        + Text(" Terms of Service")
                            .foregroundStyle(.blue)
                        + Text(".")
                    }
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    
                    Picker("Select language", selection: $selectedLanguage) {
                        ForEach(["English", "Spanish"], id: \.self) { language in
                            Text(language)
                        }
                    }

                    Spacer()
                    
                    NavigationLink("Agree and continue") {
                        LoginView()
                            .navigationBarBackButtonHidden()
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("More", systemImage: "ellipsis") {
                
            }
            .tint(.black)
        }
    }
}

#Preview {
    WelcomeView()
}
