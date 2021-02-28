//
//  PostPresenter.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation

final class PostPresenter {
    private weak var viewController: PostViewDisplayLogic?

    init(viewController: PostViewDisplayLogic) {
        self.viewController = viewController
    }

    func refresh(with post: PostModule.Post) {
        let viewModel = PostModule.ViewModel(post: post)
        DispatchQueue.main.async {
            self.viewController?.update(with: viewModel)
        }
    }

    func refresh(with error: Error) {
        DispatchQueue.main.async {
            self.viewController?.update(with: error)
        }
    }
}
