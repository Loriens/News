//
//  PostConfigurator.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

final class PostConfigurator {
    private var postId: Int

    init(postId: Int) {
        self.postId = postId
    }

    func create() -> PostView {
        let viewController = PostView()
        let presenter = PostPresenter(viewController: viewController)
        let worker = PostWorker(postId: postId)
        let interactor = PostInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = PostRouter(viewController: viewController)
        return viewController
    }
}
