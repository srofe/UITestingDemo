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
        XCTAssertEqual(username.value as? String, "test")
    }

    func testPassword() {
        app.buttons["Login"].tap()

        app.secureTextFields.element.tap()
        app.keys["p"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["s"].tap()
        app.keyboards.buttons["Return"].tap()
        XCTAssertNotEqual(app.secureTextFields.element.value as? String, "")
        XCTAssertEqual((app.secureTextFields.element.value as? String)?.count, 4)
    }

    func testLogin() {
        login()
        let loginButton = app.buttons["loginNow"]

        XCTAssertFalse(loginButton.waitForExistence(timeout: 0.5))
    }

    func testFailedLoginAlert() {
        app.buttons["Login"].tap()
        app.buttons["loginNow"].tap()

        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))

        app.alerts.element.buttons["OK"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }

    func testWelcomeAfterLogin() {
        XCTAssert(app.staticTexts["Welcome!"].exists)
        login()
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssertFalse(app.staticTexts["Welcome!"].exists)
    }

    func testLogoutLabelAfterLogin() {
        XCTAssertEqual(app.buttons["loginButton"].label, "Login")
        login()
        XCTAssertEqual(app.buttons["loginButton"].label, "Logout")
    }

    func testLogoutUpdatesWelcomPage() {
        login()
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssertEqual(app.buttons["loginButton"].label, "Logout")
        app.buttons["loginButton"].tap()
        XCTAssert(app.staticTexts["Welcome!"].exists)
        XCTAssertEqual(app.buttons["loginButton"].label, "Login")
    }

    func testColourTheme() {
        login()
        let colourTheme = app.segmentedControls["colourTheme"]
        XCTAssert(colourTheme.exists)
        XCTAssert(colourTheme.buttons["Light"].isSelected)
        colourTheme.buttons["Dark"].tap()
        XCTAssert(colourTheme.buttons["Dark"].isSelected)
    }

    func testTextSize() {
        login()
        let textSize = app.sliders["slider"]
        XCTAssert(textSize.exists)
        textSize.adjust(toNormalizedSliderPosition: 0.75)
        XCTAssertGreaterThanOrEqual(textSize.value as! String, "0.7")
    }

    func testFontPicker() {
        login()
        let wheel = app.pickerWheels.element
        XCTAssert(wheel.exists)
        XCTAssertEqual(wheel.value as! String, "Arial")
        wheel.adjust(toPickerWheelValue: "Futura")
        XCTAssertEqual(wheel.value as! String, "Futura")
    }
}

extension UITestingDemoUITests {
    func login() {
        app.buttons["Login"].tap()

        app.textFields.element.tap()
        app.textFields.element.typeText("test")

        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("pass")
        app.keyboards.buttons["Return"].tap()

        app.buttons["loginNow"].tap()
    }
}
