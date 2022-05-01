//
//  PostApiTests.swift
//  NewsTests
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest
import NetworkLayer
@testable import News

final class PostApiTests: XCTestCase {
    var expectation: XCTestExpectation?
    var networkClient: NetworkClient?
    let timeout: TimeInterval = 10

    override func setUp() {
        super.setUp()
        expectation = expectation(description: "Server responds in reasonable time")
        networkClient = DefaultNetworkClient()
    }

    func testPostListResponse() {
        let request = PostRequestFactory.list.makeRequest()
        networkClient?.perform(request: request) { (result: Result<[PostListModule.Post], NetworkError>) in
            switch result {
            case .success(let posts):
                XCTAssertFalse(posts.isEmpty)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation?.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }

    func testPostItemResponse() {
        let request = PostRequestFactory.item(postId: 1).makeRequest()
        networkClient?.perform(request: request) { (result: Result<PostModule.Post, NetworkError>) in
            switch result {
            case .success(let post):
                XCTAssertNotNil(post.body)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.expectation?.fulfill()
        }
        waitForExpectations(timeout: timeout)
    }
}
