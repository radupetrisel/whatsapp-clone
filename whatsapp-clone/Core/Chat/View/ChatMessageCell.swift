//
//  ChatMessage.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    var body: some View {
        HStack {
            Text("Hello")
            
            Text("18:44")
                .foregroundStyle(.secondary)
                .font(.caption)
        }
        .padding(12)
        .background(.peach)
        .clipShape(.chatBubble)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal)
    }
}

#Preview {
    ChatMessageCell()
}
