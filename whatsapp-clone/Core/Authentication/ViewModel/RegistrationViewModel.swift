//
//  RegistrationViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import Foundation

@Observable
final class RegistrationViewModel {
    var email: String = ""
    var fullName: String = ""
    var phoneNumber: String = ""
    var password: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email.trimmingCharacters(in: .whitespacesAndNewlines), password: password)
        try await UserService.shared.upload(fullName: fullName, email: email, phoneNumber: phoneNumber)
    }
}
