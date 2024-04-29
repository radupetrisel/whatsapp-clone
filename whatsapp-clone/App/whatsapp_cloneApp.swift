//
//  whatsapp_cloneApp.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 18.04.2024.
//

import SwiftUI
import FirebaseCore

@main
struct whatsapp_cloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
