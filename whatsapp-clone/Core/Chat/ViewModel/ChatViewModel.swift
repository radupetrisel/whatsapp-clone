//
//  ChatViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Combine
import Foundation

@Observable
final class ChatViewModel {
    private var cancellable: [AnyCancellable] = []
    
    var messageGroups: [MessageGroup]
    var message: String
    var recipient: User
    
    init(message: String = "", recipient: User) {
        self.message = message
        self.recipient = recipient
        self.messageGroups = []
        
        observeMessages()
    }
    
    func sendMessage(messageKind: Message.Kind) async throws {
        try await ChatService.shared.send(message: message, to: recipient, messageKind: messageKind)
        message = ""
    }
    
    func observeMessages() {
        ChatService.shared.observe(to: recipient)
            .sink { [unowned self] messages in
                self.messageGroups.append(MessageGroup(messages: messages, date: .now))
            }
            .store(in: &cancellable)
    }
}
