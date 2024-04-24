//
//  ProfileViewRow.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 24.04.2024.
//

import SwiftUI

struct ProfileViewRow: View {
    let leftImageName: String
    let title: String
    let description: String
    let footnote: String?
    let hasRightImage: Bool
    
    init(leftImageName: String, title: String, description: String, footnote: String? = nil, hasRightImage: Bool = true) {
        self.leftImageName = leftImageName
        self.title = title
        self.description = description
        self.footnote = footnote
        self.hasRightImage = hasRightImage
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: leftImageName)
                .font(.title2)
                .foregroundStyle(.secondary)
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundStyle(.secondary)
                
                Text(description)
                
                if let footnote {
                    Text(footnote)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                        .padding(.top, 10)
                }
            }
            
            Spacer()
            
            if hasRightImage {
                Image(systemName: "pencil")
                    .font(.title2)
                    .foregroundStyle(.secondary)
                    .padding(.top)
            }
        }
    }
}


#Preview {
    ProfileViewRow(leftImageName: "person.fill", title: "Test", description: "Some Name", footnote: "This is a long footnote", hasRightImage: true)
}
