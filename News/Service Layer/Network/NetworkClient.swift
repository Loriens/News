//
//  NetworkClient.swift
//  News
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkClient {
    
    // MARK: - Props
    static let shared = NetworkClient()
    
    let session: Session
    let retrier: RequestInterceptor
    
    // MARK: - Initalization
    private init() {
        retrier = NetworkClientRetrier()
        session = Session(interceptor: retrier)
    }
    
    // MARK: - Public functions
    static func request(with convertible: URLRequestConvertible) -> DataRequest {
        return shared.session
            .request(convertible)
            .validate()
    }
    
}
