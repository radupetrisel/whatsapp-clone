//
//  LoginViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import Foundation

@Observable
final class LoginViewModel {
    var email: String = ""
    var password: String = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
