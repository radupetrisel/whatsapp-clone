//
//  ChatMessage.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    let message: Message
    
    var isFromCurrentUser: Bool { message.isFromCurrentUser }
    
    var alignment: Alignment {
        isFromCurrentUser ? .trailing : .leading
    }
    
    var background: some ShapeStyle {
        isFromCurrentUser ? .peach : Color(white: 0.75)
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            if !isFromCurrentUser {
                Image(.elizabeth)
                    .resizable()
                    .circularProfile(.extraExtraSmall)
            }
            
            HStack {
               
                Text(message.content)
                
                Text("18:44")
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
            .padding(12)
            .background(background)
            .clipShape(.chatBubble(isFromCurrentUser: isFromCurrentUser))
        }
        .frame(maxWidth: .infinity, alignment: alignment)
        .padding(.horizontal)
    }
}

#Preview("Current user") {
    ChatMessageCell(message: .preview)
}

#Preview("Other user") {
    ChatMessageCell(message: .preview)
}
