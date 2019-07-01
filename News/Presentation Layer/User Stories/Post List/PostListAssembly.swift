//
//  PostListAssembly.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

enum PostListAssembly {
    
    // Create and return controller
    static func create() -> PostListViewController {
        return PostListViewController(nibName: PostListViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: PostListViewController) -> PostListPresenterInput {
        let presenter = PostListPresenter()
        
        let interactor = PostListInteractor()
        interactor._output = presenter
        
        let router = PostListRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
