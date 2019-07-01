//
//  PostAssembly.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

enum PostAssembly {
    
    // Create and return controller
    static func create() -> PostViewController {
        return PostViewController(nibName: PostViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: PostViewController, postId: Int) -> PostPresenterInput {
        let presenter = PostPresenter()
        
        let interactor = PostInteractor()
        interactor._output = presenter
        
        let router = PostRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
