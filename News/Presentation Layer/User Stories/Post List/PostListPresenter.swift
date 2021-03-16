//
//  PostListPresenter.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostListPresentationLogic {
    func update(with response: PostListModels.GetPostList.Response)
    func update(with response: PostListModels.OpenPost.Response)
}

final class PostListPresenter: PostListPresentationLogic {
    private weak var viewController: PostListViewDisplayLogic?

    init(viewController: PostListViewDisplayLogic) {
        self.viewController = viewController
    }

    func update(with response: PostListModels.GetPostList.Response) {
        switch response.result {
        case let .success(posts):
            var snapshot = NSDiffableDataSourceSnapshot<PostListModels.Section, PostListModels.Item>()
            snapshot.appendSections([.main])
            let items = posts.map({ PostListModels.Item.post($0) })
            snapshot.appendItems(items)
            let viewModel = PostListModels.GetPostList.ViewModel(result: .success(snapshot))
            DispatchQueue.main.async {
                self.viewController?.update(with: viewModel)
            }
        case let .failure(error):
            let viewModel = PostListModels.GetPostList.ViewModel(result: .failure(error))
            DispatchQueue.main.async {
                self.viewController?.update(with: viewModel)
            }
        }
    }
    
    func update(with response: PostListModels.OpenPost.Response) {
        let viewModel = PostListModels.OpenPost.ViewModel(postId: response.post.id)
        DispatchQueue.main.async {
            self.viewController?.update(with: viewModel)
        }
    }
}
