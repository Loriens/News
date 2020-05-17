//
//  PostApiTests.swift
//  NewsTests
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import XCTest
@testable import News

class PostApiTests: XCTestCase {
    
    // MARK: - Props
    var expectation: XCTestExpectation!
    let timeout: TimeInterval = 10
    
    // MARK: - Setup functions
    override func setUp() {
        super.setUp()
        expectation = expectation(description: "Server responds in reasonable time")
    }
    
    // MARK: - Test functions
    func testPostListResponse() {
        defer {
            waitForExpectations(timeout: timeout)
        }
        
        NetworkClient.request(with: PostApiRouter.list)
            .responseDecodable(of: [PostResponse].self) { response in
                defer {
                    self.expectation.fulfill()
                }
                
                if let error = response.error {
                    XCTFail(error.localizedDescription)
                    return
                }
                
                do {
                    let posts = try XCTUnwrap(response.value).compactMap({ $0.defaultMapping() })
                    XCTAssert(!posts.isEmpty)
                } catch { }
            }
    }
    
    func testPostItemResponse() {
        defer {
            waitForExpectations(timeout: timeout)
        }
        
        NetworkClient.request(with: PostApiRouter.item(postId: 1))
            .responseDecodable(of: PostResponse.self) { response in
                defer {
                    self.expectation.fulfill()
                }
                
                if let error = response.error {
                    XCTFail(error.localizedDescription)
                    return
                }
                
                XCTAssertNotNil(response.value?.defaultMapping())
            }
    }
    
}