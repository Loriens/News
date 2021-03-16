//
//  PostUITests.swift
//  NewsUITests
//
//  Created by Vladislav on 17.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest

final class PostUITests: XCTestCase {
    // MARK: - Props
    var app: XCUIApplication!

    // MARK: - Setup functions
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    // MARK: - Test functions
    func testOpeningFirstPost() throws {
        let cell = app.tables.staticTexts.firstMatch
        waitForElementToAppear(element: cell)
        cell.tap()
        XCTAssert(app.navigationBars["Detail"].exists)
    }

    // MARK: - Module functions
    private func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 10) {
        let existsPredicate = NSPredicate(format: "exists == 1")
        let expectation = self.expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(result, XCTWaiter.Result.completed)
    }
}
