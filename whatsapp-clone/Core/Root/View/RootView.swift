//
//  RootView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 29.04.2024.
//

import SwiftUI

struct RootView: View {
    @State private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.session != nil {
                MainTabView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    RootView()
}
