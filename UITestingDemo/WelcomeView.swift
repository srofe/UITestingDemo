//
//  WelcomeView.swift
//  UITestingDemo
//
//  Created by Simon Rofe on 29/6/21.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showLogin = false

    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.title)
            Spacer()
                .frame(height: 20)
            Button(action: {
                showLogin = true
            }, label: {
                Text("Login")
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
