//
//  NetworkError.swift
//  
//
//  Created by Markov Vladislav on 01.05.2022.
//

import Foundation

public enum NetworkError: Error, Equatable {
    case invalidStatusCode(_ statusCode: Int)
    case decoding(_ error: DecodingError)
    case unknown(_ error: Error)

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case let (.invalidStatusCode(lhsCode), .invalidStatusCode(rhsCode)):
            return lhsCode == rhsCode
        case (.decoding, .decoding):
            return true
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}
