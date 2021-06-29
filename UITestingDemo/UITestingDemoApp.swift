//
//  UITestingDemoApp.swift
//  UITestingDemo
//
//  Created by Simon Rofe on 29/6/21.
//

import SwiftUI

@main
struct UITestingDemoApp: App {
    var user = User()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(user)
        }
    }
}
