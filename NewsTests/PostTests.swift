//
//  PostTests.swift
//  NewsTests
//
//  Created by Vladislav on 29.03.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest
@testable import News

final class PostTests: XCTestCase {
    // MARK: - Test functions
    func testValidPostResponseMapsToPost() throws {
        let post = PostModule.Post(
            id: 1,
            title: "Title",
            body: "Text"
        )
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "Title")
        XCTAssertEqual(post.body, "Text")
    }
}
