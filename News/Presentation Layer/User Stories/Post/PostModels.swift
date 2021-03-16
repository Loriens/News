//
//  PostModels.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation

enum PostModels {
    enum GetPost {
        struct Request { }

        struct Response {
            let result: Result<Post, Error>
        }

        struct ViewModel {
            let result: Result<Post, Error>
        }
    }

    struct Post: Decodable {
        var id: Int
        var body: String?
    }

    enum Error: LocalizedError {
        case emptyPost
        case unknown(_ error: Swift.Error?)

        var errorDescription: String? {
            switch self {
            case .emptyPost:
                return AppLocalization.Error.Post.emptyPost.localized
            case let .unknown(error):
                return error?.localizedDescription ?? AppLocalization.Error.unknown.localized
            }
        }
    }
}
