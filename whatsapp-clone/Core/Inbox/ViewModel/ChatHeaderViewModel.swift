//
//  MessageViweModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 10.05.2024.
//

import Foundation

@Observable
final class ChatHeaderViewModel: Identifiable {
    let id = UUID()
    
    private let message: Message
    
    var content: String {
        message.content
    }
    
    var date: Date {
        message.timeStamp.dateValue()
    }
    
    private(set) var sender: User
    private(set) var receiver: User
    
    init(message: Message) async throws {
        self.message = message
        
        self.sender = try await UserService.shared.fetch(byId: message.fromId)
        self.receiver = try await UserService.shared.fetch(byId: message.toId)
    }
    
    private init() {
        self.message = .preview
        self.sender = .preview
        self.receiver = .preview
    }
}

extension ChatHeaderViewModel {
    static let preview = ChatHeaderViewModel()
}
