//
//  PostRequestFactory.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum PostRequestFactory {
    case list
    case item(postId: Int)

    private var method: String {
        switch self {
        case .list,
             .item:
            return "GET"
        }
    }

    private var path: String {
        switch self {
        case .list:
            return "/posts"
        case let .item(postId):
            return "/posts/\(postId)"
        }
    }

    func makeRequest() -> URLRequest {
        let url = URL(string: AppConfiguration.serverUrl) ?? URL(fileURLWithPath: "")
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method
        request.timeoutInterval = 10
        return request
    }
}
