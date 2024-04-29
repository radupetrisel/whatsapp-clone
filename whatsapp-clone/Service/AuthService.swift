//
//  AuthService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 29.04.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

typealias Session = FirebaseAuth.User

@Observable
final class AuthService {
    static let shared = AuthService()
    
    var session: Session?
    
    init() {
        session = Auth.auth().currentUser
    }
    
    func createUser(email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        session = result.user
    }
    
    func login(email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        session = result.user
    }
    
    func logout() async throws {
        try Auth.auth().signOut()
        session = nil
    }
}
