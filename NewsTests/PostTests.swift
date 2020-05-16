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
    
    // MARK: - Props
    var invalidPostResponse: PostResponse?
    var validPostResponse: PostResponse?

    // MARK: - Setup functions
    override func setUpWithError() throws {
        validPostResponse = PostResponse(id: 1,
                                         title: "Title",
                                         text: "Text")
        invalidPostResponse = PostResponse()
    }

    override func tearDownWithError() throws {
        validPostResponse = nil
        invalidPostResponse = nil
    }

    // MARK: - Test functions
    func testValidPostResponseMapsToPost() throws {
        let post = try XCTUnwrap(validPostResponse?.defaultMapping())
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, "Title")
        XCTAssertEqual(post.text, "Text")
    }
    
    func testInvalidPostResponseMapsToNil() throws {
        let postResponse = try XCTUnwrap(invalidPostResponse)
        XCTAssertNil(postResponse.defaultMapping())
    }

}
