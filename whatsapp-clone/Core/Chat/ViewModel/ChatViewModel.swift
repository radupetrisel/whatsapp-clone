//
//  ChatViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 07.05.2024.
//

import Combine
import Firebase
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
                let newGroups = self.groupMessagesByDate(messages)
                self.merge(messageGroups: newGroups, into: &self.messageGroups)
            }
            .store(in: &cancellable)
    }
    
    private func groupMessagesByDate(_ messages: [Message]) -> [MessageGroup] {
        Dictionary(grouping: messages, by: { Calendar.current.startOfDay(for: $0.timeStamp.dateValue()) })
            .map { key, value in MessageGroup(messages: value, date: key) }
            .sorted { $0.date < $1.date }
    }
    
    private func merge(messageGroups: [MessageGroup], into destination: inout [MessageGroup]) {
        for messageGroup in messageGroups {
            if let index = destination.firstIndex(where: { $0.date == messageGroup.date }) {
                destination[index].messages.append(contentsOf: messageGroup.messages)
            } else {
                destination.append(messageGroup)
            }
        }
    }
}
