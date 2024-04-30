//
//  ProfileViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 30.04.2024.
//

import Firebase
import FirebaseStorage
import Foundation

@Observable
final class ProfileViewModel {
    var user: User = .preview
    
    init() {
        Task {
            user = try await UserService.shared.fetch()
        }
    }
    
    func updateProfilePicture(using data: Data) async throws {
        guard let _ = AuthService.shared.session?.uid else { fatalError() }
        
        let profileImageUrl = try await MediaService.shared.uploadProfilePicture(using: data)
        
        user = try await UserService.shared.fetch()
        user.profileImageURL = profileImageUrl
        
        try await UserService.shared.upload(user)
    }
}
