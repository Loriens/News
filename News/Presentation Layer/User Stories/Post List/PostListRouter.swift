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

class PostListRouter: PostListRouterInput {
    
    // MARK: - Props
    weak var viewController: PostListViewController?
    
    // MARK: - PostListRouterInput
    func pushPostViewController(postId: Int) {
        let vc = PostConfigurator.create()
        let viewModelInput = PostConfigurator.configure(with: vc)
        viewModelInput.configure(with: postId)
        
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Module functions
}
