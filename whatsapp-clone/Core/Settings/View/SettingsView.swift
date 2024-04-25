//
//  SettingsView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var searchString = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SettingsHeader()
                
                Divider()
                
                VStack {
                    ForEach(Setting.allCases, content: SettingRow.init(setting:))
                }
            }
            .searchable(text: $searchString)
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
