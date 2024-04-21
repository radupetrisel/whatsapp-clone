//
//  ProfileImageSize.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 21.04.2024.
//

import Foundation

enum ProfileImageSize {
    case extraExtraSmall
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case extraExtraLarge
    
    var dimension: CGFloat {
        switch self {
        case .extraExtraSmall:
            return 28
        case .extraSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .extraLarge:
            return 80
        case .extraExtraLarge:
            return 120
        }
    }
}
