//
//  PostListRouter.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostListRouterInput: ViperRouterInput {
    func pushPostViewController(postId: Int) -> PostPresenterInput
}

class PostListRouter: ViperRouter, PostListRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: PostListViewController? {
        guard let mainController = self._mainController as? PostListViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - PostListRouterInput
    func pushPostViewController(postId: Int) -> PostPresenterInput {
        let vc = PostAssembly.create()
        let moduleInput = PostAssembly.configure(with: vc, postId: postId)
        
        self.push(to: vc, animated: true)
        
        return moduleInput
    }
    
    // MARK: - Module functions
}
