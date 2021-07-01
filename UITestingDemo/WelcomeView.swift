//
//  WelcomeView.swift
//  UITestingDemo
//
//  Created by Simon Rofe on 29/6/21.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var user: User
    @State private var showLogin = false

    var body: some View {
        VStack {
            Text(user.isLoggedIn ? "Welcome \(user.username)!" : "Welcome!")
                .font(.title)
            Spacer()
                .frame(height: 20)
            Button(action: {
                if user.isLoggedIn {
                    user.logout()
                } else {
                    showLogin = true
                }
            }, label: {
                Text(user.isLoggedIn ? "Logout" : "Login")
            })
                .accessibilityIdentifier("loginButton")
        }
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
