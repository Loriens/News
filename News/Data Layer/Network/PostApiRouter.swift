//
//  PostApiRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import Alamofire

enum PostApiRouter: ApiConfiguration {
    case list
    case item(postId: Int)
    
    internal var method: HTTPMethod {
        switch self {
        case .list,
             .item:
            return .get
        }
    }
    
    internal var path: String {
        switch self {
        case .list:
            return "/posts"
        case let .item(postId):
            return "/posts/\(postId)"
        }
    }
    
    internal var headers: HTTPHeaders? {
        switch self {
        case .list,
             .item:
            return nil
        }
    }
    
    internal var parameters: Parameters? {
        switch self {
        case .list,
             .item:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try AppConfiguration.serverUrl.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = 10
        if let headers = headers {
            for key in headers.dictionary.keys {
                request.setValue(headers[key], forHTTPHeaderField: key)
            }
        }
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
