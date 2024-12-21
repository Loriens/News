//
//  PostApiTests.swift
//  NewsTests
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import NetworkLayer
import XCTest
@testable import News

final class PostApiTests: XCTestCase {
    private var networkClient: NetworkClient?

    override func setUpWithError() throws {
        networkClient = DefaultNetworkClient()
    }

    @MainActor
    func testPostListResponse() async throws {
        guard let networkClient else {
            XCTFail("Network client is not initialized")
            return
        }

        let request = PostRequestFactory.list.makeRequest()
        let value: [PostResponse] = try await networkClient.send(request)
        XCTAssertFalse(value.isEmpty)
    }

    @MainActor
    func testPostItemResponse() async throws {
        guard let networkClient else {
            XCTFail("Network client is not initialized")
            return
        }

        let request = PostRequestFactory.item(postId: 1).makeRequest()
        let value: PostResponse = try await networkClient.send(request)
        XCTAssertNotNil(value.body)
    }
}
