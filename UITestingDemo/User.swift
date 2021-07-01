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
