//
//  MessageService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Combine
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
        
        let latestSenderRef = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(senderId)
            .collection(Firestore.LATEST_MESSAGES)
            .document(recipientId)
        
        let recipientRef = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(recipientId)
            .collection(senderId)
        
        let latestRecipientRef = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(recipientId)
            .collection(Firestore.LATEST_MESSAGES)
            .document(senderId)
        
        let documentId = senderRef.documentID
        
        let message = Message(id: documentId, fromId: senderId, toId: recipientId, content: message, timeStamp: .init(date: .now), kind: messageKind, user: nil)
        let messageData = try Firestore.Encoder().encode(message)
        
        try await senderRef.setData(messageData)
        try await recipientRef.document(documentId).setData(messageData)
        
        try await latestSenderRef.setData(messageData)
        try await latestRecipientRef.setData(messageData)
    }
    
    func observe(to recipient: User) -> some Publisher<[Message], Never> {
        guard let senderId = AuthService.shared.session?.uid else { return PassthroughSubject() }
        let query = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(senderId)
            .collection(recipient.id)
            .order(by: "timeStamp", descending: false)
        
        let publisher = PassthroughSubject<[Message], Never>()
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ change in change.type == .added }) else { return }
            
            let messages = changes.compactMap {
                var message = try? $0.document.data(as: Message.self)
                
                if message?.isFromCurrentUser == false {
                    message?.user = recipient
                }
                
                return message
            }
            
            publisher.send(messages)
        }
        
        return publisher
    }
}
