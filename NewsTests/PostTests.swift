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
        let postResponse = PostResponse(
            id: 1,
            title: "Title",
            text: "Text"
        )
        let post = try XCTUnwrap(postResponse.defaultMapping())
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "Title")
        XCTAssertEqual(post.text, "Text")
    }
    
    func testInvalidPostResponseMapsToNil() throws {
        let postResponse = PostResponse()
        XCTAssertNil(postResponse.defaultMapping())
    }

}
