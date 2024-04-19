//
//  ChatHeaderView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import SwiftUI

struct ChatHeaderView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(.elizabeth)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("Elizabeth Olsen")
                    .bold()
                
                Text("Hello")
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            
            Spacer(minLength: 0)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Yesterday")
                    
                    Image(systemName: "chevron.right")
                        .font(.callout)
                        .bold()
                }
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
