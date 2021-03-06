//
//  PostFactory.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

final class PostFactory {
    private let postId: PostModule.Post.Id

    init(postId: PostModule.Post.Id) {
        self.postId = postId
    }

    func create() -> PostView {
        let viewController = PostView()
        let presenter = PostPresenter(viewController: viewController)
        let interceptor = AlamofireNetworkServiceRetrier()
        let networkService = AlamofireNetworkService(interceptor: interceptor)
        let worker = PostWorker(postId: postId, networkService: networkService)
        let interactor = PostInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        let router = PostRouter(viewController: viewController)
        viewController.router = router
        return viewController
    }
}
