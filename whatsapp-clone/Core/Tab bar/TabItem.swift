//
//  TabItem.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 18.04.2024.
//

import SwiftUI

struct TabItem<T>: View where T: View {
    let title: String
    let imageName: String
    let tag: Int
    @Binding var selectedTab: Int
    @ViewBuilder var content: () -> T
    
    var body: some View {
        content()
            .tabItem {
                VStack {
                    Image(systemName: imageName)
                        .environment(\.symbolVariants, selectedTab == tag ? .fill : .none)
                    
                    Text(title)
                }
            }
            .tag(tag)
    }
}

#Preview {
    return TabView {
        TabItem(title: "Test", imageName: "person.2", tag: 0, selectedTab: .constant(0)) { Text("Test") }
        
        TabItem(title: "Test 2", imageName: "square.circle", tag: 1, selectedTab: .constant(0)) { Text("Test 2") }
    }
}
