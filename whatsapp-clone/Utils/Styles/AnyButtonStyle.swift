//
//  AnyButtonStyle.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 26.04.2024.
//

import Foundation
import SwiftUI

struct AnyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
