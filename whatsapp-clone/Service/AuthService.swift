//
//  AuthService.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 29.04.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

typealias Session = FirebaseAuth.User

@Observable
final class AuthService {
    static let shared = AuthService()
    
    var session: Session? { Auth.auth().currentUser }
    
    func createUser(email: String, password: String, fullName: String, phoneNumber: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
        
        if let session {
            let user = User(id: session.uid, fullName: fullName, email: email, phoneNumber: phoneNumber)
            try await uploadData(user: user)
        }
    }
    
    private func uploadData(user: User) async throws {
        let data = try Firestore.Encoder().encode(user)
        try await Firestore.firestore().collection(Firestore.USERS).document(user.id).setData(data)
    }
}
