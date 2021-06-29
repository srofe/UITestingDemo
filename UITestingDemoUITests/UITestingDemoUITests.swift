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
        XCTAssert(welcome.exists, "There shall be a welcome text with the text \"Welcome!\".")
    }
}
