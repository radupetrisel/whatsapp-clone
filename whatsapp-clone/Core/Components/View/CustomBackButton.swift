//
//  CustomBackButton.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Back", systemImage: "arrow.backward") { dismiss() }
            .labelStyle(.iconOnly)
            .tint(.black)
    }
}

#Preview {
    CustomBackButton()
}
