//
//  NetworkError.swift
//  
//
//  Created by Марков Владислав Викторович on 01.05.2022.
//

import Foundation

public enum NetworkError: Error {
    case invalidStatusCode(_ statusCode: Int)
    case decoding(_ error: DecodingError)
    case unknown(_ error: Error)
}
