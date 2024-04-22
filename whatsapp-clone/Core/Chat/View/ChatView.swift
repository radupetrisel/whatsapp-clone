//
//  ChatView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 22.04.2024.
//

import SwiftUI

struct ChatView: View {
    @State private var message = ""
    
    var body: some View {
        ScrollView {
            
        }
        .background(backgroundImage)
        .safeAreaInset(edge: .bottom) { messageArea }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbar(.hidden, for: .tabBar)
        .toolbar { toolbar }
        .navigationBarBackButtonHidden()
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            CustomBackButton()
            
            Image(.elizabeth)
                .resizable()
                .circularProfile(.extraSmall)
            
            Text("Elizabeth Olsen")
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
                    
                    TextField("Message", text: $message, prompt: Text(""))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .clipShape(.capsule)
                        .animation(.default.delay(0.25), value: message.isEmpty)
                    
                    ZStack {
                        if message.isEmpty {
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
                            Button("Send", systemImage: "play.fill") { }
                                .labelStyle(.iconOnly)
                                .font(.title2)
                        }
                    }
                    .animation(.linear(duration: 0.2), value: message.isEmpty)
                }
                .padding()
            }
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
