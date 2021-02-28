//
//  PostListModule.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit

enum PostListModule {
    struct ViewModel {
        let snapshot: NSDiffableDataSourceSnapshot<Section, Item>
    }

    struct Post: Decodable, Hashable {
        var id: Int
        var title: String?
    }

    enum Section {
        case main
    }

    enum Item: Hashable {
        case post(_ post: Post)
    }

    enum Route {
        enum Action {
            case openPost(id: Int)
        }
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
