//
//  PostFactory.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import NetworkLayer
import UIKit

@MainActor
final class PostFactory {
    private let postId: Int

    init(postId: Int) {
        self.postId = postId
    }

    func create() -> UIViewController {
        let networkClient = DefaultNetworkClient()
        let viewModel = PostViewModel(postId: postId, networkClient: networkClient)
        let viewController = PostView(viewModel: viewModel)
        let router = PostRouter(viewController: viewController)
        viewController.router = router
        return viewController
    }
}
