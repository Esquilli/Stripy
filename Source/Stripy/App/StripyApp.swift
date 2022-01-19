//
//  StripyApp.swift
//  Stripy
//
//  Created by Pedro Fernandez on 1/18/22.
//

import SwiftUI

@main
struct StripyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
