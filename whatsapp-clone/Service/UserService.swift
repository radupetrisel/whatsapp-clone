//
//  UserService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 29.04.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@Observable
final class UserService {
    static let shared = UserService()
    
    func upload(fullName: String, email: String, phoneNumber: String) async throws {
        guard let uid = AuthService.shared.session?.uid else { fatalError() }
        
        let user = User(id: uid, fullName: fullName, email: email, phoneNumber: phoneNumber)
        try await upload(user)
    }
    
    func upload(_ user: User) async throws {
        guard let _ = AuthService.shared.session?.uid else { fatalError() }
        
        let data = try Firestore.Encoder().encode(user)
        try await Firestore.firestore().collection(Firestore.USERS).document(user.id).setData(data)
    }
    
    func fetch() async throws -> User {
        guard let uid = AuthService.shared.session?.uid else { fatalError() }
        
        let snapshot = try await Firestore.firestore().collection(Firestore.USERS).document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}
