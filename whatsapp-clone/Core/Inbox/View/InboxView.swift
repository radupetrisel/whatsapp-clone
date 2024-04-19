//
//  ChatView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import SwiftUI

struct InboxView: View {
    @State private var searchString = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ChatHeaderView()
                    
                    ChatHeaderView()
                }
                .listStyle(.plain)
                .searchable(text: $searchString)
                
                Button("Start new chat", systemImage: "plus.bubble.fill") {
                    
                }
                .buttonStyle(.newMessage)
                .padding()
            }
            .toolbar { toolbar }
            .navigationTitle("Chats")
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Take photo", systemImage: "camera") {
                
            }
            .tint(.black)
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button("More", systemImage: "ellipsis") {
                
            }
            .tint(.black)
        }
    }
}

#Preview {
    InboxView()
}
