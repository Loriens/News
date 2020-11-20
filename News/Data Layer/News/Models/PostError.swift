//
//  PostError.swift
//  News
//
//  Created by Vladislav on 23.04.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

enum PostError: LocalizedError {
    
    case postIsNotFound
    case emptyPost
    case unknown(_ error: Error?)
    
    var errorDescription: String? {
        switch self {
        case .postIsNotFound:
            return AppLocalization.Error.Post.postIsNotFound.localized
        case .emptyPost:
            return AppLocalization.Error.Post.emptyPost.localized
        case .unknown(let error):
            return error?.localizedDescription ?? AppLocalization.Error.unknown.localized
        }
    }
    
}
