//
//  ChatView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import SwiftUI

struct InboxView: View {
    @State private var searchString = ""
    @State private var showNewMessageView = false
    @State private var selectedUser: User?
    @State private var viewModel = InboxViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(viewModel.messages, content: ChatHeaderView.init(viewModel:))
                }
                .listStyle(.plain)
                .searchable(text: $searchString)
                
                Button {
                    showNewMessageView.toggle()
                } label: {
                    Image(systemName: "plus.bubble.fill")
                }
                .foregroundStyle(.white)
                .padding()
                .background(.secondary)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
            }
            .toolbar { toolbar }
            .navigationTitle("Chats")
            .fullScreenCover(isPresented: $showNewMessageView) {
                NewMessageView(selectedUser: $selectedUser)
            }
            .navigationDestination(item: $selectedUser) { user in
                ChatView(recipient: user)
            }
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
            NavigationLink {
                ProfileView()
            } label: {
                Image(systemName: "ellipsis")
                    .tint(.black)
            }
        }
    }
}

#Preview {
    InboxView()
}
