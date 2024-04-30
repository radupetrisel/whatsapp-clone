//
//  ContactRow.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 30.04.2024.
//

import SwiftUI

struct ContactRow<Content>: View where Content: View {
    let title: String
    var detail: String? = nil
    @ViewBuilder var image: () -> Content
    
    var body: some View {
        HStack(spacing: 16) {
            image()
                .circularProfile(.small)
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                
                if let detail {
                    Text(detail)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContactRow(title: "John Doe", detail: "Hey there! I am using WhatsApp") {
        Image(.elizabeth).resizable()
    }
}
