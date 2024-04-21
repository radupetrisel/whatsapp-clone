//
//  CircularProfileImageView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 21.04.2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    let size: ProfileImageSize
    let user: User?
    
    var body: some View {
        AsyncImage(url: user?.profileImageURL) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "person.circle")
                .resizable()
                .symbolVariant(.fill)
        }
        .scaledToFill()
        .frame(width: size.dimension, height: size.dimension)
        .clipShape(.circle)
    }
}

#Preview {
    CircularProfileImageView(size: .medium, user: .preview)
}
