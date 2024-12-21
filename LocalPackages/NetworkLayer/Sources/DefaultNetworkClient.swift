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
    private let retryCount: Int
    private let priority: TaskPriority

    public init(
        session: URLSession = .shared,
        retryCount: Int = 0,
        priority: TaskPriority = .userInitiated
    ) {
        self.session = session
        self.retryCount = retryCount
        self.priority = priority
    }

    public func send<T: Decodable>(_ request: URLRequest) async throws -> T {
        try await Task.detached(priority: priority) { [session, retryCount] in
            try await self.withRetry(retries: retryCount) {
                let (data, response) = try await session.data(for: request)

                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.unknown(URLError(.badServerResponse))
                }

                guard (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.invalidStatusCode(httpResponse.statusCode)
                }

                do {
                    return try Self.decoder.decode(T.self, from: data)
                } catch let error as DecodingError {
                    throw NetworkError.decoding(error)
                } catch {
                    throw NetworkError.unknown(error)
                }
            }
        }.value
    }

    private func withRetry<T>(
        retries: Int,
        operation: () async throws -> T
    ) async throws -> T {
        var remainingAttempts = retries + 1 // +1 for initial attempt

        while true {
            do {
                return try await operation()
            } catch {
                remainingAttempts -= 1
                guard remainingAttempts > 0 else { throw error }
                try await Task.sleep(nanoseconds: delay(attempt: retries - remainingAttempts + 1))
            }
        }
    }

    private func delay(attempt: Int) -> UInt64 {
        let seconds = pow(2.0, Double(attempt))
        return UInt64(seconds * 1_000_000_000)
    }
}
