//
//  SettingsView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()
    
    @State private var searchString = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SettingsHeader(user: viewModel.user)
                
                Divider()
                
                VStack {
                    ForEach(viewModel.settings, content: SettingRow.init(setting:))
                }
            }
            .searchable(text: $searchString)
        }
        .onAppear { viewModel.fetchCurrentUser() }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
