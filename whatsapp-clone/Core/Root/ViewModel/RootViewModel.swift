//
//  RootViewModel.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 29.04.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@Observable
final class RootViewModel {
    var session: Session? { AuthService.shared.session }
}
