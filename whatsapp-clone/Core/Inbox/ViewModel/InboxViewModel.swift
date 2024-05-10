//
//  InboxViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 10.05.2024.
//

import Combine
import Foundation

@Observable
final class InboxViewModel {
    private var cancellables = Set<AnyCancellable>()
    private(set) var messages = [ChatHeaderViewModel]()
    
    init() {
        InboxService.shared.observeLatestMessages()
            .sink { messages in
                Task {
                    for message in messages {
                        let viewModel = try await ChatHeaderViewModel(message: message)
                        if let index = self.messages.lastIndex(where: { $0.receiver == viewModel.receiver }) {
                            self.messages.remove(at: index)
                        }
                        
                        self.messages.insert(viewModel, at: 0)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
