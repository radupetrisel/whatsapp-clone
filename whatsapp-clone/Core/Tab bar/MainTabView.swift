//
//  MainTabView.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 18.04.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TabItem(title: "Inbox", imageName: "bubble", tag: 0, selectedTab: $selectedTab) { InboxView() }
            
            TabItem(title: "Updates", imageName: "dial.low", tag: 1, selectedTab: $selectedTab) { Text("Updates") }
            
            TabItem(title: "Communities", imageName: "person.3", tag: 2, selectedTab: $selectedTab) { Text("Communities") }
            
            TabItem(title: "Calls", imageName: "phone", tag: 3, selectedTab: $selectedTab) { Text("Calls") }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
