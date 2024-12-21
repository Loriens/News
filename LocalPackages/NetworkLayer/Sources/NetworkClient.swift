//
//  NetworkClient.swift
//  News
//
//  Created by Vladislav Markov on 16.03.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation

public protocol NetworkClient: AnyObject, Sendable {
    func send<T: Decodable>(_ request: URLRequest) async throws -> T
}
