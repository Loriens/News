//
//  PostListPresenter.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListPresenter {
    private weak var viewController: PostListViewDisplayLogic?

    init(viewController: PostListViewDisplayLogic) {
        self.viewController = viewController
    }

    func refresh(with posts: [PostListModule.Post]) {
        var snapshot = NSDiffableDataSourceSnapshot<PostListModule.Section, PostListModule.Item>()
        snapshot.appendSections([.main])
        let items = posts.map({ PostListModule.Item.post($0) })
        snapshot.appendItems(items)
        let viewModel = PostListModule.ViewModel(snapshot: snapshot)
        DispatchQueue.main.async {
            self.viewController?.update(with: viewModel)
        }
    }

    func refresh(with error: Error) {
        DispatchQueue.main.async {
            self.viewController?.update(with: error)
        }
    }

    func route(action: PostListModule.Route.Action) {
        DispatchQueue.main.async {
            self.viewController?.route(action: action)
        }
    }
}
