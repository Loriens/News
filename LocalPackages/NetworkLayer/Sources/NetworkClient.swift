//
//  NetworkClient.swift
//  News
//
//  Created by Vladislav Markov on 16.03.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation
import Combine

public protocol NetworkClient {
    func getPublisher<T: Decodable>(request: URLRequest) -> AnyPublisher<T, NetworkError>
}
