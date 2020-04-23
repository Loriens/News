//
//  PostAPIRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import Alamofire

enum PostAPIRouter: APIConfiguration {
    
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
        let url = try (AppConfiguration.serverUrl + path).asURL()
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        // Common headers
        urlRequest.setValue(ContentType.json.value, forHTTPHeaderField: HTTPHeaderFields.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.value, forHTTPHeaderField: HTTPHeaderFields.contentType.rawValue)
        
        if let headers = headers {
            for key in headers.dictionary.keys {
                urlRequest.setValue(headers[key], forHTTPHeaderField: key)
            }
        }
        
        if let parameters = parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        return urlRequest
    }
    
}
