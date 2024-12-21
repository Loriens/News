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
    private let title1 = "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    // swiftlint:disable:next line_length
    private let body1 = "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem"

    private var networkClient: NetworkClient?
    private var testBundle: Bundle?

    override func setUpWithError() throws {
        testBundle = Bundle(for: type(of: self))
        guard let testBundle else {
            throw XCTestError(.failureWhileWaiting, userInfo: ["message": "Test bundle not found"])
        }
        networkClient = MockNetworkClient(bundle: testBundle)
    }

    override func tearDownWithError() throws {
        networkClient = nil
        testBundle = nil
    }

    @MainActor
    func testPostListResponse() async throws {
        guard let networkClient else {
            throw XCTestError(.failureWhileWaiting, userInfo: ["message": "Network client not initialized"])
        }

        // Given
        let request = PostRequestFactory.list.makeRequest()

        // When
        let posts: [PostResponse] = try await networkClient.send(request)

        // Then
        XCTAssertEqual(posts.count, 100)
        XCTAssertEqual(posts[0].id, 1)
        XCTAssertEqual(posts[0].title, title1)
        XCTAssertEqual(posts[0].body, body1)
    }

    @MainActor
    func testPostItemResponse() async throws {
        guard let networkClient else {
            throw XCTestError(.failureWhileWaiting, userInfo: ["message": "Network client not initialized"])
        }

        // Given
        let request = PostRequestFactory.item(postId: 1).makeRequest()

        // When
        let post: PostResponse = try await networkClient.send(request)

        // Then
        XCTAssertEqual(post.id, 1)
        XCTAssertEqual(post.title, title1)
        XCTAssertEqual(post.body, body1)
    }
}
