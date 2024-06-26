//
//  ChatView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct ChatView: View {
    private static let bottomID = "bottom"
    
    @State private var viewModel: ChatViewModel
    
    init(recipient: User) {
        viewModel = ChatViewModel(recipient: recipient)
    }
    
    var recipient: User { viewModel.recipient }
    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack {
                    ForEach(viewModel.messageGroups) { group in
                        Section {
                            ForEach(group.messages, content: ChatMessageCell.init(message:))
                        } header: {
                            Capsule()
                                .fill(.windowBackground)
                                .frame(width: 120, height: 44)
                                .overlay {
                                    Text(group.date.chatHeader)
                                }
                                .padding(.top, 10)
                        }
                    }
                    
                    HStack { }
                        .id(Self.bottomID)
                }
                .onReceive($viewModel.messageGroups.publisher) { _ in
                    withAnimation(.easeInOut(duration: 0.5)) {
                        proxy.scrollTo(Self.bottomID, anchor: .bottom)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(backgroundImage)
        .safeAreaInset(edge: .bottom) { messageArea }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        .toolbar { toolbar }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            CustomBackButton()
            
            AsyncImage(url: recipient.profileImageURL) { image in
                image.resizable()
            } placeholder: {
                Image(.logo).resizable()
            }
            .circularProfile(.extraSmall)
            
            Text(recipient.fullName)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        
        ToolbarItemGroup(placement: .topBarTrailing) {
            Group {
                Button("Start video call", systemImage: "video") {
                    
                }
                .symbolVariant(.fill)
                .tint(.black)
                
                Button("Start audio call", systemImage: "phone") {
                    
                }
                .symbolVariant(.fill)
                .tint(.black)
                
                Button("More", systemImage: "ellipsis") {
                    
                }
                .tint(.black)
            }
        }
    }
    
    private var backgroundImage: some View {
        Image(.background)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var messageArea: some View {
        Rectangle()
            .ignoresSafeArea()
            .frame(height: 50)
            .background(.black)
            .overlay {
                HStack(spacing: 10) {
                    Button("Attach", systemImage: "plus") {
                        
                    }
                    .font(.title2)
                    .labelStyle(.iconOnly)
                    
                    TextField("Message", text: $viewModel.message, prompt: Text(""))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .clipShape(.capsule)
                        .animation(.default.delay(0.25), value: viewModel.message.isEmpty)
                    
                    ZStack {
                        if viewModel.message.isEmpty {
                            HStack {
                                Button("Add media", systemImage: "camera") {
                                    
                                }
                                .font(.title2)
                                .labelStyle(.iconOnly)
                                
                                Button("Send voice message", systemImage: "mic") {
                                    
                                }
                                .font(.title2)
                                .labelStyle(.iconOnly)
                            }
                            
                        } else {
                            Button("Send", systemImage: "play.fill") {
                                Task {
                                    try await viewModel.sendMessage(messageKind: .text)
                                }
                            }
                            .labelStyle(.iconOnly)
                            .font(.title2)
                        }
                    }
                    .animation(.linear(duration: 0.2), value: viewModel.message.isEmpty)
                }
                .padding()
            }
    }
}

#Preview {
    NavigationStack {
        ChatView(recipient: .preview)
    }
}
