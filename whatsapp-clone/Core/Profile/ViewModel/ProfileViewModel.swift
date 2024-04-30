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
    var profileImageURL: URL?
    
    init() {
        Task {
            profileImageURL = try await UserService.shared.fetch().profileImageURL
        }
    }
    
    func updateProfilePicture(using data: Data) async throws {
        guard let _ = AuthService.shared.session?.uid else { fatalError() }
        
        let profileImageUrl = try await MediaService.shared.uploadProfilePicture(using: data)
        
        var user = try await UserService.shared.fetch()
        user.profileImageURL = profileImageUrl
        
        try await UserService.shared.upload(user)
        
        self.profileImageURL = profileImageUrl
    }
}
