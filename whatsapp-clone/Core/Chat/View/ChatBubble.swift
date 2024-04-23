//
//  ChatBubble.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        var roundedCorners: UIRectCorner = [.topLeft, .topRight]
        
        if isFromCurrentUser {
            roundedCorners.formUnion(.bottomLeft)
        } else {
            roundedCorners.formUnion(.bottomRight)
        }
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: roundedCorners, cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

extension Shape where Self == ChatBubble {
    static func chatBubble(isFromCurrentUser: Bool) -> ChatBubble { ChatBubble(isFromCurrentUser: isFromCurrentUser) }
}
