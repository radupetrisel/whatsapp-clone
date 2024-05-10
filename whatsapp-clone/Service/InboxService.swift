//
//  InboxService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 10.05.2024.
//

import Combine
import Firebase
import FirebaseFirestoreSwift
import Foundation

final class InboxService {
    static let shared = InboxService()
    
    func observeLatestMessages() -> some Publisher<[Message], Never> {
        guard let currentUserId = AuthService.shared.session?.uid else { return PassthroughSubject() }
        
        let query = Firestore.firestore()
            .collection(Firestore.MESSAGES)
            .document(currentUserId)
            .collection(Firestore.LATEST_MESSAGES)
            .order(by: "timeStamp", descending: true)
        
        let publisher = PassthroughSubject<[Message], Never>()
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added || $0.type == .modified }) else { return }
            
            let messages = changes.compactMap { try? $0.document.data(as: Message.self) }
            publisher.send(messages)
        }
        
        return publisher
    }
}
