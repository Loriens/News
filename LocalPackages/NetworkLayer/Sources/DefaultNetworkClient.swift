//
//  DefaultNetworkClient.swift
//  News
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation
import Combine

public final class DefaultNetworkClient: NetworkClient {
    private static let decoder = JSONDecoder()
    private let session: URLSession
    private let retryCount: Int
    private let queue: DispatchQueue

    public init(
        session: URLSession = .shared,
        retryCount: Int = 0,
        queue: DispatchQueue = DispatchQueue(label: "default.network.client")
    ) {
        self.session = session
        self.retryCount = retryCount
        self.queue = queue
    }

    public func getPublisher<T: Decodable>(request: URLRequest) -> AnyPublisher<T, NetworkError> {
        session
            .dataTaskPublisher(for: request)
            .subscribe(on: queue)
            .retry(retryCount)
            .tryMap { data, response in
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    throw NetworkError.invalidStatusCode(response.statusCode)
                }
                return data
            }
            .decode(type: T.self, decoder: Self.decoder)
            .mapError { error -> NetworkError in
                switch error {
                case let error as NetworkError:
                    return error
                case let error as DecodingError:
                    return .decoding(error)
                default:
                    return .unknown(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
