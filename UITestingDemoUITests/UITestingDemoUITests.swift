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

    func testLoginFromAppearance() {
        app.buttons["loginButton"].tap()
        let loginNavBarTitle = app.staticTexts["Login"]
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }

    func testLoginForm() {
        app.buttons["Login"].tap()
        let navBar = app.navigationBars.element
        XCTAssert(navBar.exists)

        let username = app.textFields["Username"]
        XCTAssert(username.exists)

        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)

        let login = app.buttons["loginNow"]
        XCTAssert(login.exists)
        XCTAssertEqual(login.label, "Login")

        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
    }

    func testLoginDismiss() {
        app.buttons["Login"].tap()
        let dismiss = app.buttons["Dismiss"]
        dismiss.tap()
        XCTAssertFalse(dismiss.waitForExistence(timeout: 0.5))
    }

    func testUsername() {
        app.buttons["Login"].tap()

        let username = app.textFields["Username"]
        username.tap()
        username.typeText("test")
        XCTAssertNotEqual(username.value as! String, "")
    }
}
