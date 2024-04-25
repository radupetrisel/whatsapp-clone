//
//  SettingsHeader.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import SwiftUI

struct SettingsHeader: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(.elizabeth)
                .resizable()
                .circularProfile(.extraLarge)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Elizabeth Olsen")
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
    SettingsHeader()
}
