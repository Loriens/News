//
//  PostApiTests.swift
//  NewsTests
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest
@testable import News

final class PostApiTests: XCTestCase {
    var expectation: XCTestExpectation?
    var networkService: NetworkService?
    let timeout: TimeInterval = 10

    override func setUp() {
        super.setUp()
        expectation = expectation(description: "Server responds in reasonable time")
        let interceptor = AlamofireNetworkServiceRetrier()
        networkService = AlamofireNetworkService(interceptor: interceptor)
    }

    func testPostListResponse() {
        defer {
            waitForExpectations(timeout: timeout)
        }
        networkService?.request(with: PostApiRouter.list)
            .responseDecodable(of: [PostListModels.Post].self) { response in
                defer {
                    self.expectation?.fulfill()
                }
                if let error = response.error {
                    XCTFail(error.localizedDescription)
                    return
                }
                do {
                    let posts = try XCTUnwrap(response.value)
                    XCTAssert(!posts.isEmpty)
                } catch {
                    XCTFail(error.localizedDescription)
                }
            }
    }

    func testPostItemResponse() {
        defer {
            waitForExpectations(timeout: timeout)
        }
        networkService?.request(with: PostApiRouter.item(postId: 1))
            .responseDecodable(of: PostModels.Post.self) { response in
                defer {
                    self.expectation?.fulfill()
                }
                if let error = response.error {
                    XCTFail(error.localizedDescription)
                    return
                }
                XCTAssertNotNil(response.value)
            }
    }
}
