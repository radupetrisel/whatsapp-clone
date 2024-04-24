//
//  ProfileView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 24.04.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .bottomTrailing) {
                Image(.elizabeth)
                    .resizable()
                    .circularProfile(.extraExtraLarge)
                
                Image(systemName: "camera.circle.fill")
                    .resizable()
                    .circularProfile(.small)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .gray)
            }
            
            ProfileViewRow(leftImageName: "person.fill", title: "Name", description: "Elizabeth Olsen", footnote: "This is not your username or pin. This name will be visible to your WhatsApp contacts.")
            
            ProfileViewRow(leftImageName: "exclamationmark.circle", title: "About", description: "Hey there! I am using WhatsApp")
            
            ProfileViewRow(leftImageName: "phone.fill", title: "Phone", description: "+88888", hasRightImage: false)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar { toolbar }
        .toolbar(.hidden, for: .tabBar)
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            CustomBackButton()
            
            Text("Profile")
                .fontWeight(.semibold)
                .font(.title2)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
