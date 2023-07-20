//
//  PostApiTests.swift
//  NewsTests
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Combine
import NetworkLayer
import XCTest
@testable import News

final class PostApiTests: XCTestCase {
    private let timeout: TimeInterval = 10
    private var expectation: XCTestExpectation?
    private var networkClient: NetworkClient?
    private var cancellables: [AnyCancellable] = []

    override func setUp() {
        super.setUp()
        expectation = expectation(description: "Server responds in reasonable time")
        networkClient = DefaultNetworkClient()
        cancellables = []
    }

    func testPostListResponse() {
        let request = PostRequestFactory.list.makeRequest()

        networkClient?
            .getPublisher(request: request)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                    expectation?.fulfill()
                }
            } receiveValue: { [unowned self] (value: [PostResponse]) in
                XCTAssertFalse(value.isEmpty)
                expectation?.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: timeout)
    }

    func testPostItemResponse() {
        let request = PostRequestFactory.item(postId: 1).makeRequest()

        networkClient?
            .getPublisher(request: request)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                    expectation?.fulfill()
                }
            } receiveValue: { [unowned self] (value: PostResponse) in
                XCTAssertNotNil(value.body)
                expectation?.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: timeout)
    }
}
