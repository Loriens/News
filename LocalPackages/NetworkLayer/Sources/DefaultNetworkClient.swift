//
//  DefaultNetworkClient.swift
//  News
//
//  Created by Vladislav on 16.05.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

public final class DefaultNetworkClient: NetworkClient {
    private static let decoder = JSONDecoder()
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func perform<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            if let response = response as? HTTPURLResponse,
               !(200...299).contains(response.statusCode) {
                completion(.failure(.invalidStatusCode(response.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.emptyData))
                return
            }
            do {
                let result = try Self.decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decoding(error)))
            }
        }
        dataTask.resume()
    }
}
