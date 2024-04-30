//
//  NewMessageViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 30.04.2024.
//

import Foundation

@Observable
final class NewMessageViewModel {
    var users: [User] = []
    
    init() {
        Task {
            let currentUser = try await UserService.shared.fetch()
            
            users = try await UserService.shared.fetchAll().filter { $0.id != currentUser.id }
        }
    }
}
