//
//  ChatViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Foundation

@Observable
final class ChatViewModel {
    var message: String
    var recipient: User
    
    init(message: String = "", recipient: User) {
        self.message = message
        self.recipient = recipient
    }
    
    func sendMessage(messageKind: Message.Kind) async throws {
        try await ChatService.shared.send(message: message, to: recipient, messageKind: messageKind)
        message = ""
    }
}
