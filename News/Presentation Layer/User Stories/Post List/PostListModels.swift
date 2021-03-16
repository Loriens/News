//
//  PostListModels.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit

enum PostListModels {
    enum GetPostList {
        struct Request { }

        struct Response {
            let result: Result<[Post], Error>
        }

        struct ViewModel {
            let result: Result<NSDiffableDataSourceSnapshot<Section, Item>, Error>
        }
    }

    enum OpenPost {
        struct Request {
            let postId: Int
        }

        struct Response {
            let postId: Int
        }

        struct ViewModel {
            let postId: Int
        }
    }

    struct Post: Decodable, Hashable {
        var id: Int
        var title: String
    }

    enum Section {
        case main
    }

    enum Item: Hashable {
        case post(viewModel: PostListCellViewModel)
    }

    enum Error: LocalizedError {
        case unknown(Swift.Error?)

        var errorDescription: String? {
            switch self {
            case let .unknown(error):
                return error?.localizedDescription ?? AppLocalization.Error.unknown.localized
            }
        }
    }
}
