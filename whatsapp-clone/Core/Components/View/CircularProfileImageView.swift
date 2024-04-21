//
//  CircularProfileImageView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 21.04.2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    let size: ProfileImageSize
    let imageURL: URL?
    let imageResource: ImageResource?
    
    init(_ imageURL: URL, size: ProfileImageSize) {
        self.imageURL = imageURL
        self.size = size
        self.imageResource = nil
    }
    
    init(_ imageResource: ImageResource, size: ProfileImageSize) {
        self.imageResource = imageResource
        self.size = size
        self.imageURL = nil
    }
    
    var body: some View {
        if let imageURL {
            AsyncImage(url: imageURL) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.circle")
                    .resizable()
                    .symbolVariant(.fill)
            }
            .scaledToFill()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(.circle)
        } else if let imageResource {
            Image(imageResource)
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(.circle)
        }
    }
}

#Preview {
    CircularProfileImageView(.elizabeth, size: .medium)
}
