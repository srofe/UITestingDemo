//
//  LoginView.swift
//  UITestingDemo
//
//  Created by Simon Rofe on 30/6/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var user: User
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $user.username)
                    SecureField("Password", text: $user.password)
                }
                Button {
                    if user.login() {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Login")
                }
                .accessibilityIdentifier("loginNow")
            }
            .navigationTitle(Text("Login"))
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .accessibilityLabel("Dismiss")
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(User())
    }
}
