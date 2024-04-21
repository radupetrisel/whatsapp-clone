//
//  NewMessageView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 21.04.2024.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(spacing: 24) {
                    ContactRow(title: "New group") {
                        Image(systemName: "person.2.circle.fill")
                            .resizable()
                            .foregroundStyle(.secondary)
                    }
                    
                    ContactRow(title: "New contact") {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundStyle(.secondary)
                    }
                    
                    ContactRow(title: "New community") {
                        Image(systemName: "shared.with.you.circle.fill")
                            .resizable()
                            .foregroundStyle(.secondary)
                    }
                }
                
                Text("Contacts on WhatsApp")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding()
                
                LazyVStack(spacing: 15) {
                    ForEach(1...10, id: \.self) { count in
                        ContactRow(title: "Elizabeth Olsen", detail: "Hey there! I am using WhatsApp") {
                            Image(.elizabeth)
                                .resizable()
                        }
                    }
                }
            }
            .padding(.top)
        }
        .toolbar { toolbar }
        .navigationBarBackButtonHidden()
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            Button("Back", systemImage: "arrow.backward") { dismiss() }
                .tint(.black)
            
            VStack(alignment: .leading) {
                Text("Select contact")
                Text("8 contacts")
                    .font(.caption)
            }
        }
        
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button("Search", systemImage: "magnifyingglass") {
                
            }
            .tint(.black)
            
            Button("More", systemImage: "ellipsis") {
                
            }
            .tint(.black)
        }
    }
}

struct ContactRow<Content>: View where Content: View {
    let title: String
    var detail: String? = nil
    @ViewBuilder var image: () -> Content
    
    var body: some View {
        HStack(spacing: 16) {
            image()
                .circularProfile(.small)
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                
                if let detail {
                    Text(detail)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NavigationStack {
        NewMessageView()
    }
}
