//
//  MessageService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Firebase
import Foundation

final class ChatService {
    static let shared = ChatService()
    
    private init() {
        
    }
    
    func send(message: String, to recipient: User, messageKind: Message.Kind = .text) async throws {
        guard let senderId = AuthService.shared.session?.uid else { fatalError() }
        
        let recipientId = recipient.id
        
        let senderRef = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(senderId)
            .collection(recipientId)
            .document()
        
        let recipientRef = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(recipientId)
            .collection(senderId)
        
        let documentId = senderRef.documentID
        
        let message = Message(id: documentId, fromId: senderId, toId: recipientId, content: message, timeStamp: .init(date: .now), kind: messageKind, user: nil)
        let messageData = try Firestore.Encoder().encode(message)
        
        try await senderRef.setData(messageData)
        try await recipientRef.document(documentId).setData(messageData)
    }
}
