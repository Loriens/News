//
//  PostListPresenter.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostListPresentationLogic {
    func update(with response: PostListModule.GetPostList.Response)
    func update(with response: PostListModule.OpenPost.Response)
}

final class PostListPresenter: PostListPresentationLogic {
    private weak var viewController: PostListViewDisplayLogic?

    init(viewController: PostListViewDisplayLogic) {
        self.viewController = viewController
    }

    func update(with response: PostListModule.GetPostList.Response) {
        switch response.result {
        case let .success(posts):
            var snapshot = NSDiffableDataSourceSnapshot<PostListView.Section, PostListView.Item>()
            snapshot.appendSections([.main])
            let items = posts.map({ PostListView.Item(postId: $0.id, title: $0.title) })
            snapshot.appendItems(items)
            let viewModel = PostListModule.GetPostList.ViewModel(result: .success(snapshot))
            DispatchQueue.main.async {
                self.viewController?.update(with: viewModel)
            }
        case let .failure(error):
            let viewModel = PostListModule.GetPostList.ViewModel(result: .failure(error))
            DispatchQueue.main.async {
                self.viewController?.update(with: viewModel)
            }
        }
    }

    func update(with response: PostListModule.OpenPost.Response) {
        let viewModel = PostListModule.OpenPost.ViewModel(postId: response.postId)
        DispatchQueue.main.async {
            self.viewController?.update(with: viewModel)
        }
    }
}
