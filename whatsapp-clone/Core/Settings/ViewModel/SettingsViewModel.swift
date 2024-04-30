//
//  Setting.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import Foundation

struct SettingViewModel: Identifiable {
    let id = UUID()
    
    var title: String
    var description: String? = nil
    var imageName: String
    var action: () -> Void = { }
}

@Observable
final class SettingsViewModel {
    var settings: [SettingViewModel] = [
        SettingViewModel(title: "Account", description: "Security notifications, change number", imageName: "key.fill"),
        SettingViewModel(title: "Privacy", description: "Block contacts, disappearing messages", imageName: "lock.fill"),
        SettingViewModel(title: "Avatar", description: "Create, edit profile photo", imageName: "face.smiling.inverse"),
        SettingViewModel(title: "Chats", description: "Theme, wallpapers, chat history", imageName: "text.bubble.fill"),
        SettingViewModel(title: "Notifications", description: "Message, group & call tones", imageName: "bell.fill"),
        SettingViewModel(title: "Storage & Data", description: "Network usage, auto-download", imageName: "circle.dotted.circle.fill"),
        SettingViewModel(title: "App Language", description: "English (same as device)", imageName: "map.circle.fill"),
        SettingViewModel(title: "Help", description: "Help centre, contact us, privacy policy", imageName: "questionmark.circle"),
        SettingViewModel(title: "Invite a Friend", imageName: "person.2.fill"),
        SettingViewModel(title: "Logout", description: nil, imageName: "rectangle.portrait.and.arrow.right.fill") { Task { try await AuthService.shared.logout() } }
    ]
    
    var user: User = .preview
    
    init() {
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        Task {
            user = try await UserService.shared.fetch()
        }
    }
}

extension SettingViewModel {
    static let preview: SettingViewModel = SettingViewModel(title: "Account", description: "Security notifications, change number", imageName: "key.fill")
}
