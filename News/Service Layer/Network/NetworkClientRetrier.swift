//
//  NetworkClientRetrier.swift
//  News
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkClientRetrier: RequestInterceptor {
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        if request.retryCount < 3 {
            completion(.retryWithDelay(1))
        } else {
            completion(.doNotRetry)
        }
    }
}
