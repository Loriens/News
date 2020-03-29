//
//  PostTests.swift
//  NewsTests
//
//  Created by Vladislav on 29.03.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest
@testable import News

class PostTests: XCTestCase {
    
    // MARK: - Props
    var emptyPostReponse: PostResponse?
    var postResponse: PostResponse?

    // MARK: - Setup functions
    override func setUpWithError() throws {
        emptyPostReponse = PostResponse()
        postResponse = PostResponse(id: 1, title: "Title", text: "Text")
    }

    override func tearDownWithError() throws {
        emptyPostReponse = nil
        postResponse = nil
    }

    // MARK: - Test functions
    func testPostResponseMapsToPost() throws {
        guard let post = postResponse?.defaultMapping() else { return }
        XCTAssert(post.id == 1)
        XCTAssert(post.title == "Title")
        XCTAssert(post.text == "Text")
    }
    
    func testEmptyPostResponseMapsToNil() throws {
        guard let emptyPostResponse = emptyPostReponse else { return }
        XCTAssertNil(emptyPostResponse.defaultMapping())
    }

}
