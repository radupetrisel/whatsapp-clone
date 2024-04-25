//
//  SettingRow.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 25.04.2024.
//

import SwiftUI

struct SettingRow: View {
    let setting: Setting
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: setting.imageName)
                .font(.headline)
                .foregroundStyle(.secondary)
            
            VStack(alignment: .leading) {
                Text(setting.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                if let description = setting.description {
                    Text(description)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SettingRow(setting: .account)
}
