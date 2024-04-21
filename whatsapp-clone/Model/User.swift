//
//  User.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 21.04.2024.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    
    var fullName: String
    var email: String
    var phoneNumber: String
    
    var profileImageURL: URL?
}

extension User {
    static let preview = User(fullName: "Wanda Maximoff", email: "wanda.maximoff@gmail.com", phoneNumber: "+11111", profileImageURL: Bundle.main.url(forResource: "elizabeth", withExtension: "jpeg"))
}
