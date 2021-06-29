//
//  UITestingDemoUITests.swift
//  UITestingDemoUITests
//
//  Created by Simon Rofe on 29/6/21.
//

import XCTest

class UITestingDemoUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testWelcome() throws {
        let welcome = app.staticTexts.element
        XCTAssert(welcome.exists, "There shall be a static text view.")
        XCTAssertEqual(welcome.label, "Welcome!", "The text view shall contain the text \"Welcome\".")
    }

    func testLoginButton() {
        let login = app.buttons["loginButton"]
        XCTAssert(login.exists, "There shall be a button with the accessibility identifier \"loginButton\".")
        XCTAssertEqual(login.label, "Login")
    }
}
