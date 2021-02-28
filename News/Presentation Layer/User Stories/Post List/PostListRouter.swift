//
//  PostListRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

final class PostListRouter {
    private weak var viewController: PostListView?

    init(viewController: PostListView) {
        self.viewController = viewController
    }

    func route(action: PostListModule.Route.Action) {
        switch action {
        case let .openPost(postId):
            DispatchQueue.main.async {
                let configurator = PostConfigurator(postId: postId)
                let vc = configurator.create()
                self.viewController?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
