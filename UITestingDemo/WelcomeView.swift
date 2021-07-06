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
            if user.isLoggedIn {
                Form {
                    Section {
                        VStack {
                            Text("Colour Theme")
                            Picker("", selection: $user.colourTheme) {
                                Text("Light").tag(0)
                                Text("Dark").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .accessibilityIdentifier("colourTheme")
                        }
                    }
                    Section {
                        HStack {
                            Text("Text Size")
                            Slider(value: $user.textSize, in: 1 ... 100)
                                .accessibilityIdentifier("slider")
                        }
                    }
                    Section {
                        VStack {
                            Text("Font")
                            Picker("", selection: $user.font) {
                                Text("Arial").tag("Arial")
                                Text("Avenir Next").tag("Avenir Next")
                                Text("Noteworthy").tag("Noteworthy")
                                Text("Futura").tag("Futura")
                            }
                            .pickerStyle(WheelPickerStyle())
                            .accessibilityIdentifier("fontPicker")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(User())
    }
}
