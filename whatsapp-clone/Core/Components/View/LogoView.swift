//
//  LogoView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image(.logo)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}

#Preview {
    LogoView()
}
