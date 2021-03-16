//
//  ContentType.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum ContentType {
    case json

    var value: String {
        switch self {
        case .json:
            return "application/json"
        }
    }
}
