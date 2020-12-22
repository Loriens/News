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
    
    private let session: Session
    private let retrier: RequestInterceptor
    
    // MARK: - Initalization
    private init() {
        retrier = NetworkClientRetrier()
        session = Session(interceptor: retrier)
    }
    
    // MARK: - Public functions
    func request(with convertible: URLRequestConvertible) -> DataRequest {
        return session
            .request(convertible)
            .validate()
    }
}
