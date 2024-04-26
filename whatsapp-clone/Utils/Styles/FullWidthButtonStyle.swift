//
//  FullWidthButtonStyle.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import Foundation
import SwiftUI

struct FullWidthButtonStyle<Background, Foreground>: ButtonStyle where Background: ShapeStyle, Foreground: ShapeStyle {
    let background: Background
    let foreground: Foreground
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(background, in: .buttonBorder)
            .foregroundStyle(foreground)
    }
}

extension ButtonStyle where Self == AnyButtonStyle {
    static func fullWidth<Background, Foreground>(background: Background, foreground: Foreground) -> FullWidthButtonStyle<Background, Foreground>
    where Background: ShapeStyle, Foreground: ShapeStyle {
        FullWidthButtonStyle(background: background, foreground: foreground)
    }
}
