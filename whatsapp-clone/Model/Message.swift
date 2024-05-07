//
//  Message.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 23.04.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

struct Message: Codable, Hashable, Identifiable {
    
    @DocumentID
    var id: String?
    
    let fromId: String
    let toId: String
    
    let content: String
    let timeStamp: Timestamp
    
    let kind: Kind
    
    let user: User?
    
    var chatPartnerId: String {
        isFromCurrentUser ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        fromId == AuthService.shared.session?.uid
    }
}

extension Message {
    static var preview: Message { Message(fromId: "", toId: "", content: "Hello", timeStamp: .init(date: .now), kind: .text, user: Bool.random() ? .preview : nil) }
}

extension Message {
    enum Kind: Codable {
        case text
        case audio
        case image
        case video
    }
}
