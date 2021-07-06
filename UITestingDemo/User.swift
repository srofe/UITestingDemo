//
//  User.swift
//  UITestingDemo
//
//  Created by Simon Rofe on 30/6/21.
//

import Combine

class User: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
    @Published var password = ""
    @Published var colourTheme = 0
    @Published var textSize: Double = 14
    @Published var font = "Arial"

    func login() -> Bool {
        guard username == "test" && password == "pass" else { return false }
        password = ""
        isLoggedIn = true
        return true
    }

    func logout() {
        isLoggedIn = false
        username = ""
    }
}
