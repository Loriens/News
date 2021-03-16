//
//  AlamofireNetworkService.swift
//  News
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Alamofire

struct AlamofireNetworkService: NetworkService {
    private let session: Session
    private let interceptor: RequestInterceptor

    init(interceptor: RequestInterceptor) {
        self.interceptor = interceptor
        session = Session(interceptor: interceptor)
    }

    func request(with convertible: URLRequestConvertible) -> DataRequest {
        return session
            .request(convertible)
            .validate()
    }
}
