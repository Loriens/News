//
//  PostRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

final class PostRouter {
    private weak var viewController: PostView?

    init(viewController: PostView) {
        self.viewController = viewController
    }
}
