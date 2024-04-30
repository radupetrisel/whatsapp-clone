//
//  SettingsHeader.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import SwiftUI

struct SettingsHeader: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: user.profileImageURL) { image in
                image.resizable()
            } placeholder: {
                Image(.logo).resizable()
            }
            .circularProfile(.extraLarge)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(user.fullName)
                    .font(.headline)
                    .bold()
                
                Text("Hey there! I am using WhatsApp")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    SettingsHeader(user: .preview)
}
