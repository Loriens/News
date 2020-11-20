//
//  PostListRouter.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

protocol PostListRouterInput {
    func pushPostViewController(postId: Int)
}

final class PostListRouter: PostListRouterInput {
    
    // MARK: - Props
    weak var viewController: PostListViewController?
    
    // MARK: - PostListRouterInput
    func pushPostViewController(postId: Int) {
        DispatchQueue.main.async {
            let vc = PostConfigurator.create()
            let viewModelInput = PostConfigurator.configure(with: vc)
            viewModelInput.configure(postId: postId)

            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
