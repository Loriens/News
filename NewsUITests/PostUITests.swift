//
//  PostUITests.swift
//  NewsUITests
//
//  Created by Vladislav on 17.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest

final class PostUITests: XCTestCase {
    private var app: XCUIApplication?

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testOpeningFirstPost() async throws {
        app = XCUIApplication()
        app?.launch()

        guard let app else {
            XCTFail("App is not initialized")
            return
        }

        let cell = try XCTUnwrap(app.tables.staticTexts.firstMatch)
        await waitForElementToAppear(element: cell)
        cell.tap()
        XCTAssert(app.navigationBars["Detail"].exists)
    }

    @MainActor
    private func waitForElementToAppear(element: XCUIElement) async {
        let predicate = NSPredicate(format: "exists == 1")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 10)
    }
}
