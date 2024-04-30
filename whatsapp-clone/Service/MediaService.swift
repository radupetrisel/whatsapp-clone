//
//  MediaService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 30.04.2024.
//

import FirebaseStorage
import Foundation

final class MediaService {
    private static let PROFILE_IMAGES = "profile_images"
    
    static let shared = MediaService()
    
    func uploadProfilePicture(using data: Data) async throws -> URL {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        return try await upload(data: data, to: Self.PROFILE_IMAGES, withMetadata: metadata)
    }
    
    private func upload(data: Data, to path: String, withMetadata metadata: StorageMetadata? = nil) async throws -> URL {
        guard let uid = AuthService.shared.session?.uid else { fatalError() }
        
        let storageRef = Storage.storage().reference(withPath: "/\(path)/\(uid)/\(UUID())")
        _ = try await storageRef.putDataAsync(data, metadata: metadata)
        
        return try await storageRef.downloadURL()
    }
}
