//
//  ChatHeaderView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import SwiftUI

struct ChatHeaderView: View {
    let user: User
    
    var body: some View {
        NavigationLink {
            ChatView(user: user)
        } label: {
            HStack(alignment: .top, spacing: 12) {
                Image(.elizabeth)
                    .resizable()
                    .circularProfile(.medium)
                
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
}


#Preview {
    List {
        ChatHeaderView(user: .preview)
    }
    .listStyle(.plain)
}
