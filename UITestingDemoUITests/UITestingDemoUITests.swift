//
//  UITestingDemoUITests.swift
//  UITestingDemoUITests
//
//  Created by Simon Rofe on 29/6/21.
//

import XCTest

class UITestingDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testWelcome() throws {
        let app = XCUIApplication()
        app.launch()
        let welcome = app.staticTexts.element
        XCTAssert(welcome.exists, "There shall be a static text view.")
        XCTAssertEqual(welcome.label, "Welcome!", "The text view shall contain the text \"Welcome\".")
    }

    func testLoginButton() {
        let app = XCUIApplication()
        app.launch()
        let login = app.buttons["Login"]
        XCTAssert(login.exists, "There shall be a button with the text \"Login\".")
    }
}
