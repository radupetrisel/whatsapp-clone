//
//  ChatBubble.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct ChatBubble: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomLeft], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

extension Shape where Self == ChatBubble {
    static var chatBubble: ChatBubble { ChatBubble() }
}
