//
//  NewMessageButtonStyle.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import Foundation
import SwiftUI

struct NewMessageButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .labelStyle(.iconOnly)
            .foregroundStyle(.white)
            .padding()
            .background(.secondary)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension ButtonStyle where Self == NewMessageButtonStyle {
    static var newMessage: NewMessageButtonStyle  { NewMessageButtonStyle() }
}
