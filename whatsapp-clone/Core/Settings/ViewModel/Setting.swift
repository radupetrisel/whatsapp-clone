//
//  Setting.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import Foundation

enum Setting: CaseIterable, Identifiable {
    var id: Setting { self }
    
    case account
    case privacy
    case avatar
    case chats
    case notifications
    case storageAndData
    case appLanguage
    case help
    case inviteAFriend
    case logout
    
    var title: String {
        switch self {
        case .account:
            "Account"
        case .privacy:
            "Privacy"
        case .avatar:
            "Avatar"
        case .chats:
            "Chats"
        case .notifications:
            "Notifications"
        case .storageAndData:
            "Storage & Data"
        case .appLanguage:
            "App Language"
        case .help:
            "Help"
        case .inviteAFriend:
            "Invite a Friend"
        case .logout:
            "Logout"
        }
    }
    
    var description: String? {
        switch self {
        case .account:
            "Security notifications, change number"
        case .privacy:
            "Block contacts, disappearing messages"
        case .avatar:
            "Create, edit profile photo"
        case .chats:
            "Theme, wallpapers, chat history"
        case .notifications:
            "Message, group & call tones"
        case .storageAndData:
            "Network usage, auto-download"
        case .appLanguage:
            "English (same as device)"
        case .help:
            "Help centre, contact us, privacy policy"
        case .inviteAFriend:
            nil
        case .logout:
            nil
        }
    }
    
    var imageName: String {
        switch self {
        case .account:
            "key.fill"
        case .privacy:
            "lock.fill"
        case .avatar:
            "face.smiling.inverse"
        case .chats:
            "text.bubble.fill"
        case .notifications:
            "bell.fill"
        case .storageAndData:
            "circle.dotted.circle.fill"
        case .appLanguage:
            "map.circle.fill"
        case .help:
            "questionmark.circle"
        case .inviteAFriend:
            "person.2.fill"
        case .logout:
            "rectangle.portrait.and.arrow.right.fill"
        }
    }
}
