//
//  ChatHeaderView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 19.04.2024.
//

import SwiftUI

struct ChatHeaderView: View {
    @State private var viewModel: ChatHeaderViewModel
    
    init(viewModel: ChatHeaderViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink {
            ChatView(recipient: viewModel.receiver)
        } label: {
            HStack(alignment: .top, spacing: 12) {
                AsyncImage(url: viewModel.receiver.profileImageURL) { image in
                    image.resizable()
                } placeholder: {
                    Image(.logo).resizable()
                }
                .circularProfile(.medium)
                
                VStack(alignment: .leading) {
                    Text(viewModel.receiver.fullName)
                        .bold()
                    
                    Text(viewModel.content)
                        .lineLimit(2)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                
                Spacer(minLength: 0)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.date.chatHeader)
                        
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
        ChatHeaderView(viewModel: .preview)
    }
    .listStyle(.plain)
}
