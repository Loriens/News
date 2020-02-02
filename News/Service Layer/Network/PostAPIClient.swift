//
//  PostAPIClient.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import Alamofire

enum PostAPIClient {
    
    // MARK: - APIRouter
    static func list(completion: @escaping (Result<[PostResponse]?>) -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(InternetConnectionError()))
            return
        }
        
        sendRequest(PostAPIRouter.list, completion: completion)
    }
    
    static func item(postId: Int, completion: @escaping (Result<PostResponse?>) -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(InternetConnectionError()))
            return
        }
        
        sendRequest(PostAPIRouter.item(postId: postId), completion: completion)
    }
    
}

// MARK: - Module functions
extension PostAPIClient {
    
    private static func sendRequest<T: Codable>(_ request: URLRequestConvertible, completion: @escaping (Result<T?>) -> Void) {
        Alamofire.request(request)
            .validate()
            .responseJSON { (response: DataResponse<Any>) in
                debugPrint(response)
                
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                let decoder = JSONDecoder()
                
                guard let data = response.data,
                    let response = try? decoder.decode(T.self, from: data) else {
                    completion(.success(nil))
                    return
                }
                
                completion(.success(response))
            }
    }
    
}
