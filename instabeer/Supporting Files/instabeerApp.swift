//
//  instabeerApp.swift
//  instabeer
//
//  Created by Julien Delferiere on 24/04/2021.
//

import SwiftUI
import Firebase

@main
struct instabeerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        
    var body: some Scene {
        WindowGroup {
            RouterView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
