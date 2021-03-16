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
    static let shared = NetworkClient()

    private let session: Session
    private let retrier: RequestInterceptor

    private init() {
        retrier = NetworkClientRetrier()
        session = Session(interceptor: retrier)
    }

    func request(with convertible: URLRequestConvertible) -> DataRequest {
        return session
            .request(convertible)
            .validate()
    }
}
