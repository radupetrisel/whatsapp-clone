//
//  CustomTextField.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import SwiftUI

struct CustomTextField: View {
    private let placeholder: String
    @Binding private var text: String
    
    private let isSecure: Bool
    
    init(_ placeholder: String, text: Binding<String>, isSecure: Bool = false) {
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .foregroundStyle(.secondary)
                .font(.system(.subheadline, design: .rounded))
                .offset(y: text.isEmpty ? 0 : -25)
            
            VStack {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
                
                Divider()
            }
        }
        .animation(.easeInOut(duration: 0.25), value: text.isEmpty)
    }
}

#Preview {
    CustomTextField("Placeholder", text: .constant(""), isSecure: false)
}
