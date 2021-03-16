//
//  PostListRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

protocol PostListRoutingLogic {
    func routeToPost(postId: Int)
}

final class PostListRouter: PostListRoutingLogic {
    private weak var viewController: PostListView?

    init(viewController: PostListView) {
        self.viewController = viewController
    }

    func routeToPost(postId: Int) {
        let configurator = PostConfigurator(postId: postId)
        let vc = configurator.create()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
