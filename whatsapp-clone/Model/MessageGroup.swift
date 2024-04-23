//
//  MessageGroup.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 23.04.2024.
//

import Foundation

struct MessageGroup: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    
    var messages: [Message]
    
    let date: Date
}

extension MessageGroup {
    static let preview: MessageGroup = MessageGroup(messages: (0..<5).map { _ in .preview }, date: .now)
}
