//
//  PostRemoteRouter.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKNetwork

enum PostRemoteRouter {
    case list
    case item(postId: Int)
    
    var method: HTTPMethod {
        switch self {
        case .list,
             .item:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "\(AppConfiguration.serverURL)/posts"
        case let .item(postId):
            return "\(AppConfiguration.serverURL)/posts/\(postId)"
        }
    }
    
    var request: URLRequest? {
        switch self {
        case .list,
             .item:
            return URLRequestFactory.create(path: self.path, parameters: nil, headers: nil, method: self.method)
        }
    }
}
