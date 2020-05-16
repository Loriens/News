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
    
    func testPostListResponse() {
        let expectation = self.expectation(description: "Get a list of posts in reasonable time")
        defer {
            waitForExpectations(timeout: 10)
        }
        
        NetworkClient.request(with: PostApiRouter.list)
            .responseDecodable(of: [PostResponse].self) { response in
                defer {
                    expectation.fulfill()
                }
                
                XCTAssertNil(response.error, response.error?.localizedDescription ?? AppLocalization.Error.unknown.localized)
                XCTAssertNotNil(response.value?.compactMap({ $0.defaultMapping() }))
            }
    }
    
    func testPostItemResponse() {
        
        let expectation = self.expectation(description: "Get a post in reasonable time")
        defer {
            waitForExpectations(timeout: 10)
        }
        
        NetworkClient.request(with: PostApiRouter.item(postId: 1))
            .responseDecodable(of: PostResponse.self) { response in
                defer {
                    expectation.fulfill()
                }
                
                XCTAssertNil(response.error, response.error?.localizedDescription ?? AppLocalization.Error.unknown.localized)
                XCTAssertNotNil(response.value)
            }
    }
    
}
