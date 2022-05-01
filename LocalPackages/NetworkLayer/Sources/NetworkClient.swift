//
//  NetworkClient.swift
//  News
//
//  Created by Vladislav Markov on 16.03.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation

public protocol NetworkClient {
    func perform<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void)
}
