//
//  PostListRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

protocol PostListRoutingLogic {
    func routeToPost(postId: PostListModule.Post.Id)
}

final class PostListRouter: PostListRoutingLogic {
    private weak var viewController: PostListView?

    init(viewController: PostListView) {
        self.viewController = viewController
    }

    func routeToPost(postId: PostListModule.Post.Id) {
        let factory = PostFactory(postId: postId)
        let vc = factory.create()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
