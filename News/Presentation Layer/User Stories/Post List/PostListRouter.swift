//
//  PostListRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

@MainActor
protocol PostListRouting {
    func routeToPost(postId: Int)
    func presentAlert(error: Error)
}

final class PostListRouter: PostListRouting {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func routeToPost(postId: PostListModule.Item.Id) {
        let factory = PostFactory(postId: postId)
        let vc = factory.create()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    func presentAlert(error: Error) {
        let title = AppLocalization.General.error.localized
        let message = error.localizedDescription
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: AppLocalization.General.ok.localized, style: .default)
        alertController.addAction(action)

        viewController?.present(alertController, animated: true)
    }
}
