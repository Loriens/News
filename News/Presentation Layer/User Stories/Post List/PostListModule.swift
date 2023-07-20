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
    enum Section {
        case main
    }

    struct Item: Hashable {
        typealias Id = Int

        let postId: Id
        let title: String

        func hash(into hasher: inout Hasher) {
            hasher.combine(postId)
            hasher.combine(title)
        }

        static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.postId == rhs.postId && lhs.title == rhs.title
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
