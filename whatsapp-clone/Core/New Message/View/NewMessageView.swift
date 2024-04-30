//
//  NewMessageView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 21.04.2024.
//

import SwiftUI

struct NewMessageView: View {
    @State private var viewModel = NewMessageViewModel()
    
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
                    ForEach(viewModel.users) { user in
                        ContactRow(title: user.fullName, detail: "Hey there! I am using WhatsApp") {
                            AsyncImage(url: user.profileImageURL) { image in
                                image.resizable()
                            } placeholder: {
                                Image(.logo).resizable()
                            }

                        }
                    }
                }
            }
            .padding(.top)
        }
        .toolbar { toolbar }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarLeading) {
            CustomBackButton()
            
            VStack(alignment: .leading) {
                Text("Select contact")
                Text("\(viewModel.users.count) contacts")
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

#Preview {
    NavigationStack {
        NewMessageView()
    }
}
