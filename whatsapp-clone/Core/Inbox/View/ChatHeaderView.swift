//
//  ChatHeaderView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import SwiftUI

struct ChatHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(.elizabeth)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("Elizabeth Olsen")
                    .bold()
                
                Text("Hello")
                    .lineLimit(2)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            
            Spacer(minLength: 0)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Yesterday")
                    
                    Image(systemName: "chevron.right")
                        .bold()
                }
                .font(.footnote)
                .foregroundStyle(.tertiary)
                
                Spacer()
            }
        }
    }
}


#Preview {
    List {
        ChatHeaderView()
    }
    .listStyle(.plain)
}
