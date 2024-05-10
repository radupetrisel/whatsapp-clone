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
        
        return try await fetch(byId: uid)
    }
    
    func fetch(byId id: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection(Firestore.USERS).document(id).getDocument()
        
        return try snapshot.data(as: User.self)
    }
    
    func fetchAll() async throws -> [User] {
        try await Firestore.firestore()
            .collection(Firestore.USERS)
            .order(by: "fullName")
            .getDocuments()
            .documents
            .map { try $0.data(as: User.self) }
    }
}
