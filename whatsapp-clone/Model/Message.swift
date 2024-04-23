//
//  Message.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 23.04.2024.
//

import Foundation

struct Message: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    
    let fromId: String
    let toId: String
    
    let content: String
//    let timeStamp: TimeStamp
    
    let isImage: Bool
    let isAudio: Bool
    let isVideo: Bool
    
    let user: User?
    
    var isFromCurrentUser: Bool {
        user != .preview
    }
}

extension Message {
    static var preview: Message { Message(fromId: "", toId: "", content: "Hello", isImage: false, isAudio: false, isVideo: false, user: Bool.random() ? .preview : nil) }
}
