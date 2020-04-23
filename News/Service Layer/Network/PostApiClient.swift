//
//  PostApiClient.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import Alamofire

enum PostApiClient {
    
    // MARK: - APIRouter
    static func list(completion: @escaping (Swift.Result<[PostResponse?]?, Error>) -> Void) {
        sendRequest(PostAPIRouter.list, completion: completion)
    }
    
    static func item(postId: Int, completion: @escaping (Swift.Result<PostResponse?, Error>) -> Void) {
        sendRequest(PostAPIRouter.item(postId: postId), completion: completion)
    }
    
}

// MARK: - Module functions
extension PostApiClient {
    
    private static func sendRequest<T: Codable>(_ request: URLRequestConvertible, completion: @escaping (Swift.Result<T?, Error>) -> Void) {
        AF.request(request)
            .validate()
            .responseDecodable(of: T.self) { (response: AFDataResponse<T>) in
                debugPrint(response)
                
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                completion(.success(response.value))
            }
    }
    
}
